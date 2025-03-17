import { application } from "./application"

import ChartsController from "./charts_controller"
application.register("chart", ChartsController)

import AutoSubmit from '@stimulus-components/auto-submit'
application.register('auto-submit', AutoSubmit)