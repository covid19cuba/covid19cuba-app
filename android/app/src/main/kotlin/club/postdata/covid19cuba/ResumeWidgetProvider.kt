package club.postdata.covid19cuba

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews

class ResumeWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(context: Context?, appWidgetManager: AppWidgetManager?, appWidgetIds: IntArray?) {
        appWidgetIds?.forEach {
            val views = RemoteViews(context?.packageName, R.layout.resume_widget_layout)
            appWidgetManager?.updateAppWidget(it, views)
        }
    }
}