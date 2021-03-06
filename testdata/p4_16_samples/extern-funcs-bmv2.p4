/*
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#include <core.p4>
#include <v1model.p4>

/** Test extern function. Set d <- s. */
extern void extern_func(out bit<32> d, bit<32> s);

header hdr {
  bit<32> a;
}

control compute(inout hdr h)
{
    apply {
        // Test enum lowering
        extern_func(h.a, 0xff);
    }
}

#include "arith-inline-skeleton.p4"
