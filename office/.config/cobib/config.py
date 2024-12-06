from pathlib import Path
from os import system
from cobib.config import Event, LabelSuffix, config
from cobib.commands import AddCommand

config.commands.note.default_filetype = "norg"
config.commands.search.grep = "rga"

config.database.file = "~/Org/3-resources/papers/literature.yaml"
config.database.git = True
config.database.format.label_default = "{unidecode(author[0].last).replace('-', '').replace(' ', '')}{year}"
config.database.format.label_suffix = ("", LabelSuffix.ALPHA)

config.parsers.yaml.use_c_lib_yaml = True

config.utils.file_downloader.default_location = "~/Files/3-resources/papers"

config.utils.file_downloader.url_map = {
    r"(.+)://www.nature.com/articles/(.+)": r"\1://www.nature.com/articles/\2.pdf",
    r"(.+)://pubs.acs.org/doi/full/(.+)\?.+": r"\1://pubs.acs.org/doi/epdf/\2",
    r"(.+)://pubs.acs.org/doi/abs/(.+)\?.+": r"\1://pubs.acs.org/doi/pdf/\2",
    r"(.+)://pubs.acs.org/doi/(.+)": r"\1://pubs.acs.org/doi/pdf/\2",
    r"(.+)://journals.aps.org/([^/]+)/abstract/(.+)": r"\1://journals.aps.org/\2/pdf/\3",
    r"(.+)://quantum-journal.org/papers/([^/]+)": r"\1://quantum-journal.org/papers/\2/pdf/",
    r"(.+)://aip.scitation.org/doi/(.+)": r"\1://aip.scitation.org/doi/pdf/\2",
}

config.utils.journal_abbreviations = [
    ("Accounts of Chemical Research", "Acc. Chem. Res."),
    ("ACM Transactions on Mathematical Software", "ACM Trans. Math. Softw."),
    ("ACS Central Science", "ACS Cent. Sci."),
    ("Advanced Quantum Technologies", "Adv. Quantum Technol."),
    ("Annalen der Physik", "Ann. Phys."),
    ("Annals of Physics", "Ann. Phys."),
    ("Canadian Journal of Physics", "Can. J. Phys."),
    ("Chemical Physics", "Chem. Phys."),
    ("Chemical Physics Letters", "Chem. Phys. Lett."),
    ("Chemical Reviews", "Chem. Rev."),
    ("Chemical Science", "Chem. Sci."),
    ("Computer Physics Communications", "Comput. Phys. Commun."),
    ("Entropy", "Entropy"),
    ("IBM Journal of Research and Development", "IBM J. Res. Dev."),
    ("International Journal of Quantum Chemistry", "Int. J. Quantum Chem."),
    ("International Journal of Theoretical Physics", "Int. J. Theor. Phys."),
    ("Journal of Chemical Theory and Computation", "J. Chem. Theory Comput."),
    ("Journal of Chemistry", "J. Chem."),
    ("Journal of Cheminformatics", "J. Cheminformatics"),
    ("Journal of Computational Chemistry", "J. Comput. Chem."),
    ("Journal of Molecular Graphics", "J. Mol. Graph."),
    ("Journal of the American Chemical Society", "J. Am. Chem. Soc."),
    ("Mathematical Proceedings of the Cambridge Philosophical Society",
     "Math. Proc. Camb. Philos. Soc."),
    ("Molecular Physics", "Mol. Phys."),
    ("Nature", "Nature"),
    ("Nature Chemistry", "Nat. Chem."),
    ("Nature Communications", "Nat. Commun."),
    ("Nature Reviews Physics", "Nat. Rev. Phys."),
    ("New Journal of Physics", "New J. Phys."),
    ("npj Computational Materials", "NPJ Comput. Mater."),
    ("npj Quantum Information", "NPJ Quantum Inf."),
    ("Optica", "Optica"),
    ("Physical Chemistry Chemical Physics", "Phys. Chem. Chem. Phys."),
    ("Physical Review", "Phys. Rev."),
    ("Physical Review A", "Phys. Rev. A"),
    ("Physical Review Applied", "Phys. Rev. Appl."),
    ("Physical Review B", "Phys. Rev. B"),
    ("Physical Review Letters", "Phys. Rev. Lett."),
    ("Physical Review Materials", "Phys. Rev. Mater."),
    ("Physical Review Research", "Phys. Rev. Res."),
    ("Physical Review X", "Phys. Rev. X"),
    ("Physics Reports", "Phys. Rep."),
    ("Proceedings of the National Academy of Sciences of the United States of America",
     "Proc. Natl. Acad. Sci. U.S.A."),
    ("Proceedings of the Royal Society of London. Series A: Mathematical, Physical and Engineering Sciences",
     "Proc. Math. Phys. Eng. Sci."),
    ("Proceedings of the Royal Society of London. Series A. Mathematical and Physical Sciences",
     "Proc. R. Soc. Lond. A Math. Phys. Sci."),
    ("PRX Quantum", "PRX Quantum"),
    ("Quantum", "Quantum"),
    ("Quantum Science and Technology", "Quantum Sci. Technol."),
    ("Reviews of Modern Physics", "Rev. Mod. Phys."),
    ("Science", "Science"),
    ("Science Advances", "Sci. Adv."),
    ("Scientific Reports", "Sci. Rep."),
    ("The Journal of Chemical Physics", "J. Chem. Phys."),
    ("The Journal of Physical Chemistry", "J. Phys. Chem."),
    ("The Journal of Physical Chemistry A", "J. Phys. Chem. A"),
    ("The Journal of Physical Chemistry C", "J. Phys. Chem. C"),
    ("The Journal of Physical Chemistry Letters", "J. Phys. Chem. Lett."),
    ("Theoretica Chimica Acta", "Theor. Chem. Acc."),
    ("Theoretical Chemistry Accounts", "Theor. Chem. Acc."),
    ("Wiley Interdisciplinary Reviews: Computational Molecular Science",
     "Wiley Interdiscip. Rev. Comput. Mol. Sci."),
    (r"Zeitschrift f{\"u}r Physik", "Z. Phys."),
    ("Endiconti: Accademia Nazionale dei Lincei", "Rend. Accad. Naz. Lincei"),
]

config.tui.preset_filters = [
    "++tags new",
    "++tags high",
    "++tags medium",
    "++tags low",
]

@Event.PostAddCommand.subscribe
def add_new_tag(cmd: AddCommand) -> None:
   for entry in cmd.new_entries.values():
       if "new" not in entry.tags:
           entry.tags = entry.tags + ["new"]

@Event.PostGitCommit.subscribe
def push_to_remote(root: Path, file: Path) -> None:
    system(f"git -C {root} push origin master")
