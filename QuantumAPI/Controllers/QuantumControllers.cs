using Microsoft.AspNetCore.Mvc;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using QuantumApp;

namespace QuantumAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class QuantumController : ControllerBase
    {
        [HttpGet]
        public async Task<long> Get()
        {
            using var sim = new QuantumSimulator();
            var result = await GetQuantumRandomNumber.Run(sim);
            return result;
        }
    }
}
