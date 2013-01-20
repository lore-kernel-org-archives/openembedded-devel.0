Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tx3v3-0005d9-1X
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 00:03:18 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Jan 2013 14:47:42 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so111491vbb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=eMIFaaqI2NDm70hg2gHP32zwvupIOUtpQFAqzAtOQII=;
	b=Ey08VcFr2+9TFYTAnd5Slz1f2f8i0IiH+n+qOaTn8myQJrXY0fvcupIcH+pX1/2uyI
	/lUNv4zEkipK0L4T27dCQYNTAOYqXRYHWlbRFH1aKm+MOK5OR8ydyQQ3FG8ewioRe4ND
	1NB0g2h9k54xjsk11THz5lEn+IkZTBQSm8PunWq4u7xJ/erDeDZel7cEg53U5xsAl/p0
	fjsOVNPcCtgERaCKHBsvEFvURaslXl9i9qkpXQDiLFdWexdwOb1SC12NygyiELYD//Er
	mUWuixgFW7ZTMVlffi5ECckO7GxiCPctxMFJZaZQ7fGdiG+8psyj23QawlXd7S5X7Slr
	wANw==
X-Received: by 10.220.115.133 with SMTP id i5mr17253759vcq.42.1358722061127;
	Sun, 20 Jan 2013 14:47:41 -0800 (PST)
X-Received: by 10.220.115.133 with SMTP id i5mr17253755vcq.42.1358722061028;
	Sun, 20 Jan 2013 14:47:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Sun, 20 Jan 2013 14:47:20 -0800 (PST)
In-Reply-To: <1358721879-1549-1-git-send-email-ross.burton@intel.com>
References: <1358721879-1549-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 20 Jan 2013 22:47:20 +0000
Message-ID: <CAJTo0LauNRsArzQEqeFdQDDXu-G5H1bKmiTzWUDtDeyP0h-yEQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlxX7h/OWyOc/AdaoSEREeuADZUwP3qUg3xXsiPmKfNTG+P6z4JSEs3lTs5GuI8/SCHpOhuFnaojIfhTBITk4G3sB/cOwjcu9mGlrJjqMwOhvtqJ0HeZyFKXGS6jXdJPUJ2bRWRz36dymMbmEgWTn4RBEA7T3l5W6CbOeXX1k+mRbqVoGU2/i3e8ldEZ7odGhNe9R50
Subject: Re: [meta-oe][PATCH] libcanberra: upgrade and refresh packaging
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
X-List-Received-Date: Sun, 20 Jan 2013 23:03:18 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2013 22:44, Ross Burton <ross.burton@intel.com> wrote:
> Update to 0.29 (latest, 0.30, needs GStreamer 1.0) and refresh the package based
> on the different recipes in oe-core and meta-oe.

Note that when this is accepted, I plan on removing libcanberra from oe-core.

Ross


