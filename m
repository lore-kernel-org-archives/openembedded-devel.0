Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M3Xm1-0003Ym-Dw
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 17:50:37 +0200
Received: (qmail invoked by alias); 11 May 2009 15:44:03 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp069) with SMTP; 11 May 2009 17:44:03 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1/JSW9zvhjJnUk8c+kGPNgnTt1bHRGEWFJ6rH8XCi
	IW52qvmSzJTMp5
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@openembedded.org
Date: Mon, 11 May 2009 17:44:00 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.28-11-generic; KDE/4.2.3; i686; ; )
MIME-Version: 1.0
Message-Id: <200905111744.00650.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.77,0.77
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: image generation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2009 15:50:37 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi,

I am generating a image based in the micro-image.
I have added a new package to the image and worked OK.
Now, I have added several files to that package, but they are not in the final 
image.

I can see the files in the install directory of the package, so I guess they 
are into the package.

I have cleaned the package and the image, and built again the image. In the 
process, the package is being built again, but the new files are lost.

The files I have added are into /etc and /etc/init.d/, Dont know if there is a 
special way to add files there. 


-- 
  - Eismann -

