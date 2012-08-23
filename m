Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T4Tnm-0005L2-63
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2012 11:34:10 +0200
Received: by iaky10 with SMTP id y10so933834iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 02:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/HIyD8gnNWqiXDvJs+2QNYe5EUUtmx245m3LPwLEs64=;
	b=l+dnzau6eqryav72F1Ho9/8KuA6uuCL295Iyew24d1IVfhO0yznik40etCx+R96L/z
	mjCARui4xFr+oVfRHd2sooKr+eoy6egHLhQE972dcZlUn7nbVF6XxAjX1mQKKD1I8q0W
	JMARAw8/OFma9fXwN1F1VmPRSCgqDaUiG6JTRPnaQCg1QPi9u8/XLvAboMCbyar2ESb3
	A4ANAVg8mY4ZnP3BRfItlO7zYEAJEZo4ngrjUKq+maylzAU/uynxhzAvoEcV5Y3YVodv
	6pMNmUqG6C5B1KpwyrK2OzcjqPVOaxU5MV6FSJKjwh6dV6U9dn31vLV7c48BgwfJfq2S
	boQg==
MIME-Version: 1.0
Received: by 10.50.88.195 with SMTP id bi3mr5148676igb.50.1345713723490; Thu,
	23 Aug 2012 02:22:03 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 23 Aug 2012 02:22:03 -0700 (PDT)
Date: Thu, 23 Aug 2012 11:22:03 +0200
Message-ID: <CALbNGRTC=AL5g+CPvHQzVijDf9AJj3dHmxs7H7MeY4y5VygYKQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: gnome.bbclass
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
X-List-Received-Date: Thu, 23 Aug 2012 09:34:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

we have gnome.bbclass in oe-core and meta-oe. The only difference I
see is meta-oe extends

BBCLASSEXTEND += "native"

Could somebody help me why we need to build all gnome recipes native?

Andreas


