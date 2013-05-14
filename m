Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UcCKA-0007ZM-S8
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 12:19:18 +0200
Received: by mail-vc0-f171.google.com with SMTP id m16so299879vca.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 03:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=LjmiXIg2S+NVoi03+ezmQnNxN7A+3lffyP7IC17PeyQ=;
	b=FfiHOEkyhUcBm3QedUgTGiwNgMWg+eQX0u6KEE/xk+Uv5lWpug/o7nUPXpIxIDAWaj
	zt4E8Dp037zNbYyiQOjk15KXJiaqW/dD+1I8QjZCs8iIRrPADh9aOBY3hZUdjyXn7TkE
	NPGdiAQTquYZ8Z0VFrqtvY2vNxpVoo5T/CkYOuYI5NUC21dXPjGeYiO3NuXIlxR/aga6
	wQUbzKYlan8kXhzk5niyKVoydpHWs9kidI/vWQc/HOAAh0eeNlbizZ2/wlOekRxZcrfK
	NiDjSSX2A2TaiGDptHQNV3mevZ0kg8cZ7cwc3dhVLV9IRRuHvchESxWTOCz3vEW1NG9U
	9skA==
X-Received: by 10.52.165.99 with SMTP id yx3mr17715532vdb.34.1368525663602;
	Tue, 14 May 2013 03:01:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 14 May 2013 03:00:43 -0700 (PDT)
In-Reply-To: <CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
	<20130513215201.GF3187@jama>
	<CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
	<CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2013 11:00:43 +0100
Message-ID: <CAJTo0LYRkU6rqWh6=X2UhEcrRJiDonW-_anT4YVqRRgffa1tQw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkt9u67OEN6lzI1DKlNXynwIqws+uOTCGtAWdPcmFRBS4qUDGoH9d19Gpu3eANDhkZGtF7r
Subject: Re: [meta-oe PATCH] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Tue, 14 May 2013 10:19:19 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2013 10:59, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 May 2013 22:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> I pondered about it but I think it is of generic use. I don't think we
>> need to have meta-multimedia to be able to use it.
>
> +1 for meta-multimedia.
>
> Also I'm getting bored of Big Buck Bunny, how about Sintel instead. :)

Oh, you should probably say what encoding is used in the description.
Even the file listing doesn't help as "avi" is rather vague.

Ross


