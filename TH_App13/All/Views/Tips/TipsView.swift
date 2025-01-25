//
//  TipsView.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct TipsView: View {
    
    @StateObject var viewModel = TipsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Tips")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                    })
                }
                .padding(.bottom, 40)
                
                VStack(spacing: 0) {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.curType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 4).fill(viewModel.curType == index ? Color("prim") : Color("prim").opacity(0.5)))
                        })
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.curType == "Guide to Plant Care" {
                        
                        Image("t1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(60)
                        
                        Text("""

1. Selection of Appropriate Soil
Scientific Basis: Soil is the primary medium for plant growth, providing essential nutrients, water, and support for roots. Different plants have specific soil requirements to thrive. For example, succulents and cacti require sandy, well-drained soil, whereas tropical plants prefer nutrient-rich, organic mixes.

Detailed Advice:
Use soil test kits to analyze pH and nutrient levels.
Modify soil composition by adding perlite, sand, or organic matter to achieve the required drainage and nutrient balance.
Avoid overcompacted soil, as it reduces aeration and water infiltration.

2. Watering Practices
Scientific Basis: Water is critical for photosynthesis and nutrient transport. However, overwatering or underwatering disrupts cellular function, leading to root rot or dehydration.

Detailed Advice:
Measure soil moisture with a hygrometer or by inserting your finger 2-3 cm deep into the soil.
Adjust watering frequency based on plant species, pot size, and environmental factors such as humidity and temperature.
Water early in the morning to minimize evaporation and allow plants to absorb moisture efficiently.

3. Light Requirements
Scientific Basis: Light intensity and duration affect photosynthesis, the process by which plants convert light into energy. Insufficient light can lead to etiolation, while excessive light may cause leaf scorching.

Detailed Advice:
Study the light requirements of your plant species. For instance, succulents need full sunlight, while ferns thrive in low light.
Use light meters to assess light levels in different areas of your home.
Employ grow lights with the correct spectrum for plants lacking natural sunlight.

4. Fertilization
Scientific Basis: Fertilizers supply essential macro- (nitrogen, phosphorus, potassium) and micronutrients (iron, magnesium, zinc) that support plant growth and development.

Detailed Advice:
Apply fertilizers during active growth phases, typically spring and summer.
Use species-specific fertilizers (e.g., high-phosphorus blends for flowering plants).
Avoid over-fertilizing, as it can lead to salt buildup in the soil, harming root systems.

5. Repotting
Scientific Basis: Over time, plants outgrow their containers, leading to root binding, nutrient depletion, and poor water drainage.

Detailed Advice:
Repot young plants annually and mature plants every 2-3 years.
Choose pots 1-2 inches larger in diameter than the current pot to prevent overwatering.
Ensure the new pot has adequate drainage holes to prevent waterlogging.

6. Pest Management
Scientific Basis: Pests such as aphids, mites, and whiteflies feed on plant tissues, disrupting photosynthesis and causing stress to the plant.

Detailed Advice:
Regularly inspect leaves and stems for signs of infestation, such as discoloration, holes, or sticky residue.
Use integrated pest management (IPM) strategies, including biological controls (e.g., ladybugs), mechanical removal (e.g., pruning), and chemical treatments as a last resort.
Maintain plant health through proper care to reduce susceptibility to pests.

7. Temperature and Humidity Control
Scientific Basis: Temperature and humidity regulate metabolic processes, including transpiration and photosynthesis. Deviations from optimal conditions stress plants, reducing growth rates.

Detailed Advice:
Monitor temperature and humidity using digital hygrometers and thermometers.
Place plants away from drafts, radiators, and air conditioners.
Increase humidity for tropical plants by grouping them, using pebble trays, or employing humidifiers.

8. Seasonal Adjustments
Scientific Basis: Seasonal changes in temperature, light, and humidity affect plant growth cycles. Adapting care routines to these changes ensures consistent health.

Detailed Advice:
Reduce watering and fertilization during winter dormancy periods.
Rotate plants periodically to ensure even light exposure.
Protect outdoor plants from frost using covers or by relocating them indoors during cold seasons.

Conclusion
Optimal plant care requires understanding the specific needs of each species and applying scientific principles to meet those needs. Regular observation, environmental adjustments, and proper maintenance ensure plants thrive in various conditions. Using tools like the SproutSpace app can simplify tracking and managing these tasks, promoting healthier, more vibrant plants.

""")
                        
                    } else {
                        
                        Image("t2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(60)
                        
                        Text("""

Scientific Basis
Plants have evolved to thrive in specific environments, and matching the plant to the available conditions ensures healthy growth and reduces maintenance.

Detailed Advice
Low Light Conditions:
Opt for shade-tolerant species such as pothos, snake plants, or peace lilies. These plants can photosynthesize efficiently even with minimal light.
Ideal for areas like bathrooms, offices, or corners with indirect sunlight.
High Light Conditions:
Choose sun-loving plants like succulents, cacti, or rubber plants, which require direct sunlight for several hours a day.
Perfect for windowsills, sunrooms, or outdoor settings.
High Humidity:
Tropical plants like ferns, calatheas, and orchids thrive in humid environments. Place them in bathrooms or use a humidifier to maintain moisture.
Regular misting can also benefit these plants.
Low Humidity:
Opt for drought-tolerant plants such as succulents and ZZ plants, which can store water in their leaves or stems.
Suitable for dry, air-conditioned spaces or areas with low rainfall.
Temperature Variations:
Research the plant’s tolerance to temperature changes. Hardy plants like spider plants or jade plants can withstand fluctuating conditions, while tropical species require stable, warm temperatures.
Space Constraints:
For small spaces, consider compact plants like bonsai, herbs, or trailing species like string of pearls.
Vertical gardens or hanging planters can maximize space efficiency.
Pet Safety:
If you have pets, select non-toxic plants such as areca palms, parlor palms, or Boston ferns to avoid potential health risks.

Conclusion
Choosing the right plants for your environment minimizes the effort needed for their care and ensures they thrive. Consider light, humidity, temperature, and safety factors when selecting plants, and use tools like the SproutSpace app to track and optimize their care effectively.


""")
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
    }
}

#Preview {
    TipsView()
}
