//
//  ObservablePattern.swift
//  34th-Sopt-Assignment
//
//  Created by 김민서 on 6/5/24.
//

class ObservablePattern<T> { // --- a

    var value: T? { // --- b
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
       
    private var listener: ((T?) -> Void)? // --- c
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)    // 생략 가능, 여기선 시작되는 순간부터 초기값을 갖고 동작하기 위해 사용
        self.listener = listener
    }
}

