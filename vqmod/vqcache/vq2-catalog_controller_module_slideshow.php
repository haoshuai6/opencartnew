<?php
class ControllerModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		
				if($this->config->get('config_template') == 'monkey') {
					$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/javascript/owl-carousel2/owl.carousel.css');
				} else {
					$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
				}
			
		
				if($this->config->get('config_template') == 'monkey') {
					$this->document->addScript('catalog/view/theme/' . $this->config->get('config_template') . '/javascript/owl-carousel2/owl.carousel.min.js');
				} else {
					$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
				}
			

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/slideshow.tpl', $data);
		} else {
			return $this->load->view('default/template/module/slideshow.tpl', $data);
		}
	}
}
