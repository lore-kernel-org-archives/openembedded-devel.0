Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 594C0713A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 23:49:04 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so3453291qcy.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 15:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ciW+DObtA150qRhHEFSlZhg0BB9OdSGOfD+dHDMrrX4=;
	b=Ml9EmZ0kzo/1vBtYx0bbhEQGwxMjM7zqjSeswG1BPTtK+thyobenvdDBOzBl7cUwRN
	/i4nDXubHkbjx7Qq4rnVxDl4OHH3dWehQYcKovKfPsB+e7sRqi/zAnpBkIbtIZ3aPmXR
	joWlY4V2D9zGiRAIF+ke7nDcmZFB3CPbgoc81fKSiBARwCQMRQaLMqfd4pv3pZKcscEB
	Q759ljHa1rtxhk1xFOBbjaHVD3ZTBjn+vJpP+zRhc78BdXcGhjuEdB7SpONJyedjAUq8
	eBKwzpaQtbT0LeodDAQYcE2Ab+rQlPfS82HXcCXBs4wzG9qShdR7kSqkvytVWKg2Evs4
	ZqwQ==
X-Gm-Message-State: ALoCoQmgOhaDWeeLZv7qkYUJ+NXHAUIsXC6j7IBd4lYp2TV0JW7e4Kq9ZmxxyOETC4gKVrAPE8b1
X-Received: by 10.224.160.83 with SMTP id m19mr15796170qax.17.1415404144817;
	Fri, 07 Nov 2014 15:49:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 15:48:44 -0800 (PST)
In-Reply-To: <CAMKF1so1Bv-1EuDHGhLOmQ_XBhm38i-vu=m3fERN4ztgw573pQ@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
	<CAMKF1sqUOM=FrvXkhoEkFpxMd0=GZ4deAoJnKDdCQkhesRuc0g@mail.gmail.com>
	<CAMKF1so1Bv-1EuDHGhLOmQ_XBhm38i-vu=m3fERN4ztgw573pQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 23:48:44 +0000
Message-ID: <CAJTo0LZeqimJ5CX7Fg_3qEDo=-ihyh2pZ+vMOftoYR0MMc2uAw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Moving llvm to oe-core?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Nov 2014 23:49:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 7 November 2014 15:58, Khem Raj <raj.khem@gmail.com> wrote:

> I have been creating copies of it in meta-clang where I was trying to
> get clang based
> cross compiler working.
>

I've not looked into detail as to how llvm/clang/etc are built, would a
branch importing meta-clang into oe-core be a suitable starting point?  Or
is the llvm recipe in meta-oe more current/usable?

(let's cut to the chase: would you be interested in and able to help merge
LLVM into oe-core?)

Thanks,
Ross

