Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ7dP-0005iY-Vm
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 20:28:25 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so8001200lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 12:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=l/ELmFN1zWP1P/Y0qM+wuj0xBf8lfnhArduSPbe59jo=;
	b=pFHpStcyWSDnCcULP1gVq3sE0+8xe4NaVzHMjXRFec7atln2UUH42SHkF+6BkfEhGr
	Mp/WuNTgUk+lwo20SZhD7Q8WBgS0esmDuaJUPClVMyWcDm4lD7WPaOke680CeGJ8nncA
	JoMGYh4cGRyIFCZ+rlmP141HIcCI0WCWUmKGe5Le9y3jq66KzQRAoFdsg6QUBtX+kWLX
	DNgVC65bHNTSDwz27GqU8hoj66Dr02sbKK83WcicMfPi11EiEovoqld2+6Hj+XRRjZ/x
	L4Wl7/aN/W7IiUzMW9VrR2T90J04FJhhouxkesr5p30o9xYCL78Rc91meph4ECmDm9ep
	iI6w==
X-Received: by 10.152.115.196 with SMTP id jq4mr1215171lab.53.1363979481399;
	Fri, 22 Mar 2013 12:11:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Fri, 22 Mar 2013 12:11:00 -0700 (PDT)
In-Reply-To: <20130322190434.GV3219@jama>
References: <cover.1363973088.git.ross.burton@intel.com>
	<876b70b30d4ed72bed465147dc6ecf28f331e2f7.1363973088.git.ross.burton@intel.com>
	<20130322190434.GV3219@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Mar 2013 19:11:00 +0000
Message-ID: <CAJTo0LZka2bbRHc5anCA8MFiW33cR76TgCZx_MVX1mf_xQwdfA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnch/gWoA/w/s8BDGiaF1DdlH2oAdsuxx1KFHRiyG5vUIDxiqe6n936CfT2iaUCkCoUoSyY
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 09/22] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Fri, 22 Mar 2013 19:28:38 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2013 19:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> Isn't DISTRO_FEATURES_INITMAN removed later in this series?

Yes.  I reviewed this series entirely twice and still this slipped
through.  Consider the chunks mentioning INITMAN gone.

Ross


