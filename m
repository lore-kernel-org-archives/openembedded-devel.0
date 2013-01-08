Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsYrd-0006VE-Tm
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 14:05:11 +0100
Received: from mail-vc0-f200.google.com ([209.85.220.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 04:49:57 -0800
Received: by mail-vc0-f200.google.com with SMTP id f13so714764vcb.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 04:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=XaBAX+1CbDEmn8SxIcH5Ydl7oW1ok5BzKqLvKTfmLMg=;
	b=pqP4DhaVLpATLIkEinJU/Zc/k9FgQxmbJfeuo89Z0yA8T8GXkT79dDUDB/6ESd3TXU
	579GafK3HfpDbqVs4HKjy1iCJhpCtwDYh1y25aVvYaWUEJZxm2dlFZ3iRcFBXpOgkAcd
	4P/hMEYXRimUUFLHSSiqZZP2fjTjuNNSysue1wOp4jWFc+cjIKFEtyjuHp/JUlmBndcy
	8q5WQvJ+/2HrVO8nHE0mmmZKIFOFFKE5fSDRRzFl/9sl+17wznPdEaDoKi71cdNogeDf
	eoROo4u9SM+b43bjxJ3hliOiQCbWp+pto2hnoAZ82aEMD98cmk1iNdh3BaTEtoLVLTEd
	G/cQ==
X-Received: by 10.58.181.42 with SMTP id dt10mr4346694vec.34.1357649396780;
	Tue, 08 Jan 2013 04:49:56 -0800 (PST)
Received: by 10.58.181.42 with SMTP id dt10mr4346685vec.34.1357649396657; Tue,
	08 Jan 2013 04:49:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 04:49:36 -0800 (PST)
In-Reply-To: <1357649112-11476-1-git-send-email-ross.burton@intel.com>
References: <1357649112-11476-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 12:49:36 +0000
Message-ID: <CAJTo0LaaTG-VpBkie9XUnRL6+mpAjF=JG4-sGp8n4nVHd5c1ug@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn+2rSd7u533ZDwVpidLJneliZCu7KzzWcOvZi071HOK19PpyXVn18rEylSQ17ZHF6NbsjVB5tlo2HMzb9dnWcbQKUKwLcDblDD6eKpQMlhHxr8fGUkngVSlwBRTM+w94jN8AcOn0SCzPLxYW4ZLakDJOHqd6GIG8zb2f3OTpG3tNmrLKSeSCUnRVFwYlS9TiTdmXsT
Subject: Re: [PATCH meta-gnome 1/2] at-spi2-core: add
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
X-List-Received-Date: Tue, 08 Jan 2013 13:05:20 -0000
Content-Type: text/plain; charset=UTF-8

On 8 January 2013 12:45, Ross Burton <ross.burton@intel.com> wrote:
> This is a build dependency for GTK+ 3.6.x
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

To actually build this needs some data type sizes added to site.  I've
got patches for x86 and x86-64, contributions welcome for other
architectures so that I'm not guessing.

Ross


