import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure MedicineSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MedicineAdmittedObject where
  space : MedicineSpace
  randomizedControlledTrial : Prop
  primaryEndpoint : Prop
  studyPopulation : Type
  populationTopology : TopologicalSpace studyPopulation
  resultSummary : Prop
  conclusion : resultSummary

def MedicineWitnessClosed (O : MedicineAdmittedObject) : Prop :=
  O.resultSummary

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse
