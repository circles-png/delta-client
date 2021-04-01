//
//  InnermostNetworkLayer.swift
//  DeltaClient
//
//  Created by Rohan van Klinken on 1/4/21.
//

import Foundation

protocol InnermostNetworkLayer: InboundNetworkLayer {
  associatedtype Packet
  associatedtype Output
  
  var outboundSuccessor: OutboundNetworkLayer? { get set }
  var thread: DispatchQueue { get set }
  var handler: ((Output) -> Void)? { get set }
  
  func send(_ packet: Packet)
}