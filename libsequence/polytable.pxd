from libcpp.utility cimport pair
from libcpp.string cimport string
from libcpp.vector cimport vector

from polysitevector cimport polymorphicSite,polySiteVector,psite_vec_const_itr

cdef extern from "Sequence/PolyTable.hpp" namespace "Sequence":
    cdef cppclass PolyTable(pair[vector[double],vector[string]]):
        const string & operator[](const size_t &) const
        vector[string].iterator begin()
        vector[string].iterator end()
        vector[double].iterator pbegin()
        vector[double].iterator pend()
        vector[string] GetData() const
        vector[double] GetPositions() const

        bint assign(const psite_vec_const_itr &,
                    const psite_vec_const_itr & )
        bint assign[NUMERIC,STRING]( const NUMERIC *,
                                     const size_t &,
                                     const STRING *,
                                     const size_t & )
        bint empty() const
        double position(unsigned &) const
        unsigned numsites() const
        unsigned size() const
        
                
cdef extern from "Sequence/SimData.hpp" namespace "Sequence":
    cdef cppclass SimData(PolyTable):
        SimData()

cdef extern from "Sequence/PolySites.hpp" namespace "Sequence":
    cdef cppclass PolySites(PolyTable):
        PolySites()

cdef class polyTable:
    cdef PolyTable * thisptr
    cpdef size(self)
    cpdef GetData(self)
    cpdef GetPositions(self)
    cpdef empty(self)
    cpdef assign(self,const vector[polymorphicSite] & d)
    cpdef assign_sep(self,const vector[double] & pos,const vector[string] & data)

cdef class simData(polyTable):
    pass

cdef class polySites(polyTable):
    pass