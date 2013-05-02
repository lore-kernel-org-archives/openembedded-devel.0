Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXubn-0006X6-Kz
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 16:35:44 +0200
Received: by mail-ve0-f179.google.com with SMTP id oz11so541754veb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 07:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=WBoPeqpLhdWMc9WVKNBzTFgL6WrYtorwx7lrhU2KTQ8=;
	b=AOj4xw77bw8FK9LQ732X1Jwz9IiMi88WTpXcb9u9EXtXJgelN1n9vUmy041pzfCXFe
	0ldDj6G5bRqlcnfGLM/tmXoghtbkLtOXhBDk/PpEyRcsrtDaoH0s/eXv7gXTjh9+xlMQ
	WG5BvBpXw4cQAltLOF/obmexwJRghPT70tztPsLG6i8xJX79aahVV0RkjdB8z/Zu8okd
	jsxr422LSkH84HJpTKxaqx7cSG9SCZ+PfDSEkZgbCwRC4qjpadNGPygep3CRsyFGHK15
	vLRRTeZSakdr2GdSbYOQsn6qgTEVYJOx9KhrrSXxfmxoJOQ4q5z4eLasZxOn0PLVP+xl
	Jvsw==
X-Received: by 10.58.90.66 with SMTP id bu2mr2214168veb.29.1367504269667; Thu,
	02 May 2013 07:17:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 07:17:28 -0700 (PDT)
In-Reply-To: <5182701F.5030605@pseudoterminal.org>
References: <2924564.6VWmlqGvL5@helios> <5182701F.5030605@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 15:17:28 +0100
Message-ID: <CAJTo0LbO+gQshPB4oBLHkrViGMo2154DWqrWexAiSDsOxqe6cA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnWJQrotKa6+g/n4qa7180TNDpzA0kAtfEgflxsPjiUjoGoZBBAFRVGgrogiqAWQdizDq9b
Subject: Re: Please submit your unindexed layers
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
X-List-Received-Date: Thu, 02 May 2013 14:35:44 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 14:54, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> While I do have a layer for GStreamer 1.0 , I did not want to add it to the
> index. My guess was that OE core developers might have been preparing
> recipes for GStreamer 1.0 for later OE core versions already, so the layer
> would then eventually be in conflict with OE core.
>
> So, should I add it now?

Please add it, it's useful until it's integrated into oe-core.  With
that said, please re-base your branch to master and send it to the
oe-core list - the sooner we get it in the better.

Ross


