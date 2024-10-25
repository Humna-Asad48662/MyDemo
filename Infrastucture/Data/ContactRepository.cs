using System.Threading.Tasks;
using Angular17WithASP.Application.DTOs;
using Angular17WithASP.Application.Interfaces;
using Angular17WithASP.Core.Entities;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace Angular17WithASP.Infrastucture.Data
{
    public class ContactRepository : IContactRepository
    {
        private readonly DXFullAppContext _dbContext;
        private readonly IMapper _mapper;

        public ContactRepository(DXFullAppContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<IEnumerable<ContactDTO>> GetAllContactsAsync()
        {
            try
            {
                return await _dbContext.Contacts.AsNoTracking()
                    .ProjectTo<ContactDTO>(_mapper.ConfigurationProvider)
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException("Error fetching contacts.", ex);
            }
        }

        public async Task<ContactDTO> GetContactByIdAsync(int id)
        {
            try
            {
                return await _dbContext.Contacts.AsNoTracking()
                    .Where(c => c.Id == id)
                    .ProjectTo<ContactDTO>(_mapper.ConfigurationProvider)
                    .FirstOrDefaultAsync();
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException($"Error fetching contact with ID {id}.", ex);
            }
        }

        public async Task<string> GetContactByIdAsJSONAsync(int id)
        {
            try
            {
                var contactDTO = await GetContactByIdAsync(id);
                if (contactDTO == null)
                {
                    return null;
                }

                string json = JsonConvert.SerializeObject(contactDTO, Formatting.Indented,
                    new JsonSerializerSettings
                    {
                        ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                        ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver()
                    });

                return json;
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException($"Error fetching contact with ID {id} as JSON.", ex);
            }
        }

        public async Task<IReadOnlyCollection<OpportunityDTO>> GetOpportunitiesForContactAsync(int contactId)
        {
            try
            {
                var opportunityList = await _dbContext.Opportunities
                    .Where(o => o.ContactId == contactId)
                    .AsNoTracking()
                    .ProjectTo<OpportunityDTO>(_mapper.ConfigurationProvider)
                    .OrderBy(o => o.Name)
                    .ToListAsync();

                return opportunityList;
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException($"Error fetching opportunities for contact ID {contactId}.", ex);
            }
        }

        public async Task<ContactDTO> CreateContactAsync(ContactDTO contactDTO)
        {
            try
            {
                var contact = _mapper.Map<Contact>(contactDTO);
                _dbContext.Contacts.Add(contact);
                await _dbContext.SaveChangesAsync();
                return _mapper.Map<ContactDTO>(contact);
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException("Error creating contact.", ex);
            }
        }

        public async Task<ContactDTO> UpdateContactAsync(ContactDTO contactDTO)
        {
            try
            {
                var contact = await _dbContext.Contacts.FindAsync(contactDTO.Id);
                if (contact == null)
                {
                    return null;
                }

                _mapper.Map(contactDTO, contact);
                await _dbContext.SaveChangesAsync();
                return _mapper.Map<ContactDTO>(contact);
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException($"Error updating contact with ID {contactDTO.Id}.", ex);
            }
        }

        public async Task<bool> DeleteContactAsync(int id)
        {
            try
            {
                var contact = await _dbContext.Contacts.FindAsync(id);
                if (contact == null)
                {
                    return false;
                }

                _dbContext.Contacts.Remove(contact);
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                // Log the exception
                throw new ApplicationException($"Error deleting contact with ID {id}.", ex);
            }
        }
    }
}
