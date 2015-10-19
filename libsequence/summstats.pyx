from libcpp.cast cimport dynamic_cast
from cython.view cimport array as cvarray
from cpython cimport array
from cython.operator cimport dereference as deref

cdef class polySNP:
    def __cinit__(self,polyTable p,bint haveOutgroup = False, unsigned outgroup = 0, bint totMuts = True):
       self.thisptr = new PolySNP(p.thisptr,haveOutgroup,outgroup,totMuts)
    def thetapi(self):
        return self.thisptr.ThetaPi()
    def thetaw (self):
        return self.thisptr.ThetaW()
    def thetah (self):
        return self.thisptr.ThetaH()
    def thetal (self):
        return self.thisptr.ThetaL()

    #calculate various numbers related to polymorphism
    def numpoly(self):                 
        return self.thisptr.NumPoly() 
    def nummutations (self):
        return self.thisptr.NumMutations() 
    def numsingletons (self):
        return self.thisptr.NumSingletons() 
    def numexternalmutations (self):
        return self.thisptr.NumExternalMutations() 
    #summary statistics of the site frequency spectrum
    def tajimasd (self):
        return self.thisptr.TajimasD()
    def hprime (self,bint likeThorntonAndolfatto = False):
        return self.thisptr.Hprime(likeThorntonAndolfatto)
    def fulid (self):
        return self.thisptr.FuLiD()
    def fulif (self):
        return self.thisptr.FuLiF()
    def fulidstar (self):
        return self.thisptr.FuLiDStar()
    def fulifstar (self):
        return self.thisptr.FuLiFStar()
    def wallsb(self):
        return self.thisptr.WallsB()
    def wallsbprime(self):
        return self.thisptr.WallsBprime()
    def wallsq(self):
        return self.thisptr.WallsQ()

cdef class polySIM:
    def __cinit__(self,simData d):
        self.thisptr = new PolySIM(dynamic_cast['SimData*'](d.thisptr))
    def thetapi(self):
        return self.thisptr.ThetaPi()
    def thetaw (self):
        return self.thisptr.ThetaW()
    def thetah (self):
        return self.thisptr.ThetaH()
    def thetal (self):
        return self.thisptr.ThetaL()

    #calculate various numbers related to polymorphism
    def numpoly(self):                 
        return self.thisptr.NumPoly() 
    def nummutations (self):
        return self.thisptr.NumMutations() 
    def numsingletons (self):
        return self.thisptr.NumSingletons() 
    def numexternalmutations (self):
        return self.thisptr.NumExternalMutations() 
    #summary statistics of the site frequency spectrum
    def tajimasd (self):
        return self.thisptr.TajimasD()
    def hprime (self,bint likeThorntonAndolfatto = False):
        return self.thisptr.Hprime(likeThorntonAndolfatto)
    def fulid (self):
        return self.thisptr.FuLiD()
    def fulif (self):
        return self.thisptr.FuLiF()
    def fulidstar (self):
        return self.thisptr.FuLiDStar()
    def fulifstar (self):
        return self.thisptr.FuLiFStar()
    def wallsb(self):
        return self.thisptr.WallsB()
    def wallsbprime(self):
        return self.thisptr.WallsBprime()
    def wallsq(self):
        return self.thisptr.WallsQ()

##functions
def lhaf( polyTable pt, double l ):
    if isinstance(pt,simData):
        return lHaf(deref(dynamic_cast['SimData*'](pt.thisptr)),l)
    else:
        raise RuntimeError("lhaf: only simData objects are allowed")

def std_nSL(polyTable pt, double minfreq = 0., double binsize = 0.05, double[:] gmap = None):
    if isinstance(pt,simData):
        if gmap is None:
            return snSL(deref(dynamic_cast['SimData*'](pt.thisptr)),minfreq,binsize,NULL)
        else:
            return snSL(deref(dynamic_cast['SimData*'](pt.thisptr)),minfreq,binsize,&gmap[0])
    else:
        raise RuntimeError("lhaf: only simData objects are allowed")
