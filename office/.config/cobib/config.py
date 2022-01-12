from cobib.config import LabelSuffix, config

config.commands.search.grep = "rga"

config.database.git = True
config.database.format.label_default = "{author.split()[1] if len(author.split()) > 1 else author}{year}"
config.database.format.label_suffix = ("", LabelSuffix.ALPHA)

config.parsers.yaml.use_c_lib_yaml = True

config.tui.prompt_before_quit = False

config.utils.file_downloader.default_location = '~/Downloads'

config.utils.file_downloader.url_map = {
    r"(.+)://www.nature.com/articles/(.+)": r"\1://www.nature.com/articles/\2.pdf",
    r"(.+)://pubs.acs.org/doi/abs/(.+)\?.+": r"\1://pubs.acs.org/doi/pdf/\2",
    r"(.+)://pubs.acs.org/doi/(.+)": r"\1://pubs.acs.org/doi/pdf/\2",
    r"(.+)://journals.aps.org/prxquantum/abstract/(.+)": r"\1://journals.aps.org/prxquantum/pdf/\2",
    r"(.+)://journals.aps.org/prb/abstract/(.+)": r"\1://journals.aps.org/prb/pdf/\2",
    r"(.+)://quantum-journal.org/papers/([^/]+)": r"\1://quantum-journal.org/papers/\2/pdf/",
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
