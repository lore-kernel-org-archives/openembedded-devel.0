Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SlRSv-0006iZ-2a
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jul 2012 23:13:57 +0200
Received: by vcbfl15 with SMTP id fl15so3155603vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jul 2012 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=X+nO3LiMCT5z/rMoPiTIeG3uHN61RMyOXKBwSEyZ7sc=;
	b=XezIaebyczeIxCGnip0Nc1A6euGhmo79BwoxQ9EQ4gKPA3l99PjLvT7Km+nTipJMXL
	+8MOzbHljF/b8iuCMI+4l7xFKGXVxzd2H0uazBX5J4efkXOHIz8IoV8w/jADEUVvoDgb
	HsaSwT1ofc/+KxisjZB8z58pX44Nc9pGpzn/lbX8txNZUCIsJWs5VWd6ZowROMgzUtEi
	hv0oItlI9zlcH6qLK2LcFMTctPITOw3iF5eIFcI20+DcdTVgpaIu4mXBMicRoS3M3ewT
	MNTMprEkTnj7q8qdRA3fWo6oqTeu6F4cfckTFXjnN3UV7Fb7xZMso9OlaEleVl4voUz/
	ABCg==
MIME-Version: 1.0
Received: by 10.52.23.107 with SMTP id l11mr4142702vdf.6.1341176576804; Sun,
	01 Jul 2012 14:02:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.32.9 with HTTP; Sun, 1 Jul 2012 14:02:56 -0700 (PDT)
In-Reply-To: <9a4427b73e6410ee3c7d194a38225a54778fffae.1339428767.git.otavio@ossystems.com.br>
References: <cover.1339428767.git.otavio@ossystems.com.br>
	<9a4427b73e6410ee3c7d194a38225a54778fffae.1339428767.git.otavio@ossystems.com.br>
Date: Sun, 1 Jul 2012 18:02:56 -0300
X-Google-Sender-Auth: E4fyjtS3JjwdeyCa_WNGW8W4Qv4
Message-ID: <CAP9ODKp9CUBC3Ef5YS0s4iQ+8ib=OkcHAM7xX3bmyckAnvwS3A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe 3/3] cpuburn-neon: fix packaging to use a date as version and valid sources
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
X-List-Received-Date: Sun, 01 Jul 2012 21:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 11, 2012 at 12:34 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>  * The package were not versioning the sources as the files had no
>    version on its name. We workaround it mangling the DL_DIR;
>
>  * We now dynamically check if the machine has or not neon feature and
>    set COMPATIBLE_MACHINE.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Ping?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


