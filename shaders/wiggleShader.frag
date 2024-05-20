#pragma header
		//uniform float tx, ty; // x,y waves phase
		uniform float time = 0.0;

		/**
		 * How fast the waves move over time
		 */
		uniform float uSpeed;
		
		/**
		 * Number of waves over time
		 */
		uniform float uFrequency;
		
		/**
		 * How much the pixels are going to stretch over the waves
		 */
		uniform float uWaveAmplitude;

		vec2 sineWave(vec2 pt)
		{
			float x = 0.0;
			float y = 0.0;
			
	
			float offsetX = sin(pt.y * uFrequency + time * uSpeed) * uWaveAmplitude;
            pt.x += offsetX; // * (pt.y - 1.0); // <- Uncomment to stop bottom part of the screen from moving

			
			return vec2(pt.x + x, pt.y + y);
		}

		void main()
		{
			vec2 uv = sineWave(openfl_TextureCoordv);
			gl_FragColor = texture2D(bitmap, uv);
		}