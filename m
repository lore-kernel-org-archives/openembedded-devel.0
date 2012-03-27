Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCPuf-0007bM-Hf
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 08:29:49 +0200
Received: by iaag37 with SMTP id g37so10181935iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2012 23:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2D2JxxfwvHIrx2kGXaqkp/nhTtD32I4d+OsdWS+Ef+w=;
	b=XXfKttlu15sosMUlC83JKD9XbWZ8whAxbfSfY2yg1cgkJPnavIIB+y8W+bfycx3sw6
	Vkmp/esmdw4PK3Ga+MPBBAO2dtpQRQwPaMRFOyBvDIaX8DWSBVSDso+oXW4H8nfcZVqy
	Q6858Y8iJUNsj1iRQizILGNNWGdoDbNC7uFS6mbsYiVmqfMgTeRvwCYLeHx/QdEXe1fh
	RJPQ1/PcyRxVAWw/ICvbLdRzTFT0g/FfCiT8wNeRB+D7FVr2AZMpXblmxeN8xGvWVUJf
	C6YUVbvuPCwUb9Rx4AKMxZIrUHevirIAaed6agK1N09de5/GTHJPJ+F5g2gLXw7JohFu
	vNNw==
MIME-Version: 1.0
Received: by 10.50.192.228 with SMTP id hj4mr7610057igc.65.1332829248390; Mon,
	26 Mar 2012 23:20:48 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Mon, 26 Mar 2012 23:20:48 -0700 (PDT)
In-Reply-To: <CAP9ODKrnm4QuLpSgg_19iVFB7sPTtq2QG_jd63+omDRZD6fPPg@mail.gmail.com>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-3-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRQpfgBgu-nSax+5r9ucXLKsQYZr+QJOGx2JLjZR3zTUpg@mail.gmail.com>
	<CALbNGRRq6C-mO_LG6YRpu_8VPHKv2gZrYsEkgVRM04TjO=+Egw@mail.gmail.com>
	<CALbNGRSB1YTihC36UL1d3M92gz+GyOjXY=D3nHZxfvFVD37nfw@mail.gmail.com>
	<CAP9ODKrnm4QuLpSgg_19iVFB7sPTtq2QG_jd63+omDRZD6fPPg@mail.gmail.com>
Date: Tue, 27 Mar 2012 08:20:48 +0200
Message-ID: <CALbNGRReWAk12G3z9u1rkP=G=N5B2oQyX-joZsbYAsviSRfvQg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/4] udev: remove 173
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
X-List-Received-Date: Tue, 27 Mar 2012 06:29:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 27, 2012 at 4:20 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> NACK! 175+ breaks libertas ... or has it been fixed?
177+ breaks we have 175 left

Andreas


