//
//  LineChartViewVC.swift
//  UGSwiftMagicbox
//
//  Created by admin on 2019/6/13.
//  Copyright © 2019 MBA. All rights reserved.
//

import UIKit

class LineChartViewVC: UIViewController,ChartViewDelegate {
    let chartView = LineChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        createLineChartView()
        setChart(dataPoints: ["张三","李四"/*,"张5","李6"*/], values: [1.0, 2.0, /*1.0, 2.0*/])

        
    }
    func createLineChartView()
    {
        // 签协议
        chartView.delegate = self
        chartView.backgroundColor = .white
        self.view.addSubview(chartView)
        chartView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: kNavigationHeight, left: 10, bottom: kTabBarHeight, right: 10))
        }
    }
    // 加上模拟数据
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Units Sold")
        
        let chartData = LineChartData(dataSet: chartDataSet)
        // 加上一个界限, 演示图中红色的线
        let jx = ChartLimitLine(limit: 12.0, label: "I am LimitLine")
        chartView.rightAxis.addLimitLine(jx)
        chartView.data = chartData
        // 自定义颜色
        // colors 是一个数组, 可以给相应的颜色
        chartDataSet.colors = [.ug_randomColor]
        chartDataSet.colors = ChartColorTemplates.colorful()
        chartView.animate(yAxisDuration: 1.0, easingOption: .easeInBounce)
    }


}
