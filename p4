class Graph:
 def __init__(self,graph,H,start):
  self.graph=graph
  self.H=H
  self.start=start
  self.solution={}
 def minCost(self,v):
  cost={}
  for nodes in self.graph.get(v,[]):
   c=sum(self.H[n]+w for n,w in nodes)
   cost[c]=[n for n,w in nodes]
  m=min(cost)
  return m,cost[m]
 def aoStar(self,v):
  print("Node:",v)
  if v not in self.graph:
   return
  m,child=self.minCost(v)
  self.H[v]=m
  self.solution[v]=child
  for i in child:
   self.aoStar(i)
 def printSol(self):
  print("Solution Graph:",self.solution)
graph={
 'A':[[('B',1),('C',1)],[('D',1)]],
 'B':[[('G',1)],[('H',1)]],
 'C':[[('J',1)]],
 'D':[[('E',1),('F',1)]]
}
H={
 'A':1,
 'B':6,
 'C':2,
 'D':12,
 'E':2,
 'F':1,
 'G':5,
 'H':7,
 'J':1
}
g=Graph(graph,H,'A')
g.aoStar('A')
g.printSol()
