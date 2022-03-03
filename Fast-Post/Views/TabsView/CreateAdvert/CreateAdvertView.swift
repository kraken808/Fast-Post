//
//  CreateAdvertView.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

struct CreateAdvertView: View {
    @State private var from_dest = ""
    @State private var to_dest = ""
    @State private var descriptionText = ""
    @State private var dateText = ""
    @State private var transportText = ""
    @State private var datePeriod = Date()
    @State private var isShowCalendarWidget = false
    @State private var isShowTransportAlert = false
    var advert = ["","","",""]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                VStack(spacing: 15) {
                    fieldsTitle
                    textFieldGroups()
                    createRequestButton
                }
                Spacer()
            }.padding(.horizontal, 13)
        }
        .navigationBarHidden(true)
    }
    private var fieldsTitle: some View {
        HStack(spacing: 5) {
            Text(R.string.localizedString.leave_request_msg.string)
                .font(R.font.firaSansBold.font(size: 16))
                .foregroundColor(R.color.accentRed.color)
            R.image.ic_paper_airplane.image
            Spacer()
        }.padding(.horizontal,12)
    }
    private func textFieldGroups() -> some View {
        VStack(spacing: 10) {
            textfield(placeholder: R.string.localizedString.from_where.string, text: $from_dest)
            textfield(placeholder: R.string.localizedString.to_where.string, text: $to_dest)
            HStack(spacing: 9) {
                date
                weight
            }
            HStack(spacing: 9) {
                transport
                price
            }
            description
        }
    }
    private func textfield(placeholder: String, text: Binding<String>) -> some View {
        BasicTextfield(placeholder: placeholder,
                       text: text,
                       returnKeyType: .done,
                       tag: 0)
            .padding(.horizontal)
            .font(R.font.firaSansRegular.font(size: 14))
            .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
            .background(Color.white)
            .standardRadius10()
            .basicShadow()
    }
    private var searchButton: some View {
        Button {
            //TODO: ACTION
        } label: {
            Text(R.string.localizedString.search.string)
                .foregroundColor(R.color.accentBlueMain.color)
                .font(R.font.firaSansMedium.font(size: 15))
                .frame(width: UIScreen.main.bounds.width * 0.3467, height: 48)
                .background(Color.white)
                .standardRadius10()
                .basicShadow()
        }
    }
    private var date: some View {
        TextGroup(placeholder: R.string.localizedString.date.string,
                  text: $dateText,
                  imageContent: { R.image.ic_calendar.image })
            .onTapGesture {
                isShowCalendarWidget = true
            }.sheet(isPresented: $isShowCalendarWidget) {
                DatePickerWidget(date: $datePeriod)
            }
    }
    private var transport: some View {
        TextGroup(placeholder: R.string.localizedString.transport.string,
                          text: $transportText,
                          imageContent: { R.image.ic_car.image })
            .onTapGesture {
                isShowTransportAlert = true
            }.sheet(isPresented: $isShowTransportAlert) {
                TrasportTypeAlert()
            }
    }
    private var weight: some View {
        TextFieldWithItem(placeholder: R.string.localizedString.weight.string,
                          imageContent: { R.image.ic_box_placeholder.image })
    }
    private var price: some View {
        TextFieldWithItem(placeholder: R.string.localizedString.price.string,
                          imageContent: { R.image.ic_tenge.image })
    }
    private var description: some View {
        Group {
            if descriptionText.isEmpty {
                VStack {
                    TextField(R.string.localizedString.description.string,text: $descriptionText)
                        .font(R.font.firaSansMedium.font(size: 14))
                        .padding(.vertical, 18)
                        .padding(.horizontal, 26)
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.height * 0.177)
                .background(Color.white)
                .standardRadius10()
                .basicShadow()
            } else {
                VStack {
                TextEditor(text: $descriptionText)
                    .font(R.font.firaSansMedium.font(size: 14))
                    .padding(.vertical, 18)
                    .padding(.horizontal, 26)
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.height * 0.177)
                .background(Color.white)
                .standardRadius10()
                .basicShadow()
            }
        }
    }
    private var createRequestButton: some View {
        Button {
            
        } label: {
            HStack {
                Text(R.string.localizedString.leave_request.string)
                    .font(R.font.firaSansMedium.font(size: 14))
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width - 26, height: 48)
            .background(R.color.accentBlueMain.color)
            .standardRadius10()
        }

    }

}

struct CreateAdvertView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAdvertView()
    }
}


