import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

def ConstrainedMedicineClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_medicine_endgame (A : AdmissibleClass) :
    ConstrainedMedicineClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse
