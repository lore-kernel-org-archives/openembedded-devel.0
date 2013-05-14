Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UcCJ0-0007Gi-4A
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 12:18:06 +0200
Received: by mail-vc0-f169.google.com with SMTP id kw10so311099vcb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 02:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=TgvAiM5+5UbByc8jiyO4vpEUxoxbG+DKiO5RG8aycv0=;
	b=S1bZy7+qcm1rf/I86MfmVdfIwEIFUZIQGesPq7BHOT9NDOowOsKYJLtGVS5MS5fuQ8
	rEnCtB/Hht7t/Eq5d8C7S8r1DHK3g930Snxaxdt1c03GvS5YW4CttyGAX7kILT/ZHszQ
	JvCS4nCAiZJ51Qa9GlKyrCHx5C4E8fwlnj2qX1rC4rici/+J+JiB7gwotCUdcCp6zhdf
	ru1wcGBcJSAXiVqUKGFtts5MvDc0RsV/Kk6oMWHKQ43O8y9bES6HpJlVq81hula3of9o
	safe0nlQdkdUcReerNBeVO/wguLuZzX+NKuKVEaMs/S5Xq6mHZKvQD+umQa3C1fvaVPL
	31WQ==
X-Received: by 10.220.191.129 with SMTP id dm1mr7007645vcb.54.1368525590813;
	Tue, 14 May 2013 02:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 14 May 2013 02:59:30 -0700 (PDT)
In-Reply-To: <CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
	<20130513215201.GF3187@jama>
	<CAP9ODKpXcX5H6ndoz9ikz+0cUE9RPC7AvvAt8iKD+vHnoqXyqQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2013 10:59:30 +0100
Message-ID: <CAJTo0LZ-ng_=n_RcWcdhJY3E4ZgnFUiDCKpgBsLwLbOg6ExjSg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmKOHfiPxEt47R6kUr1ef48Vglr0Z3EiWsqTq1BPD+vp83KhLs5t7+wMdNAkzFjuFjaSnDt
Cc: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 14 May 2013 10:18:12 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 22:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I pondered about it but I think it is of generic use. I don't think we
> need to have meta-multimedia to be able to use it.

+1 for meta-multimedia.

Also I'm getting bored of Big Buck Bunny, how about Sintel instead. :)

Ross


