Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Qy3ZK-0003ww-Ei
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 17:16:10 +0200
Received: (qmail 21907 invoked by uid 2404007); 29 Aug 2011 15:11:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 29 Aug 2011 15:11:14 -0000
Message-ID: <4E5BAC16.7000605@juszkiewicz.com.pl>
Date: Mon, 29 Aug 2011 17:11:18 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110828 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
	<1314621621-26512-2-git-send-email-yauhen.kharuzhy@promwad.com>
In-Reply-To: <1314621621-26512-2-git-send-email-yauhen.kharuzhy@promwad.com>
X-Enigmail-Version: 1.2.1
Subject: Re: [PATCH 1/3] Add linux kernel recipe and patches for mycable's Jade Evaluation Board
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
X-List-Received-Date: Mon, 29 Aug 2011 15:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 29.08.2011 14:40, Yauhen Kharuzhy pisze:
> diff --git a/recipes/linux/linux-jade_2.6.27.bb b/recipes/linux/linux-jade_2.6.27.bb
> new file mode 100644
> index 0000000..cc8bc60
> --- /dev/null
> +++ b/recipes/linux/linux-jade_2.6.27.bb

NACK

Please use recipes/linux/linux_2.6.27.bb as a base of your kernel.


