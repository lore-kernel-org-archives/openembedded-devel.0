Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 97F577142F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 13:04:35 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so652091qgd.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 06:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SuIZlbZrOPbuT6OFqIArRPr275zmR7GfV4bKdplLJ+I=;
	b=hqCM5kBRSSPIGF4htFLnuhXQ/0K6um8taKxDimMVO2GiRnXTUGV0vW4+Vnhp1g/s4Z
	mQ0pag6Ty77XuQXhIl3TJfcUMPye8SxKESpVCcL16nx87fbT/yWsgGQHVkPajYG/9iiT
	MowYZqzfVoZKY+tls32eUFbP+flDIOHRSdA1mTBnnpfIBzUtmU2zr9Vza42uiXsTSkJK
	XRk8F1ReaAMz00VdJo6JTOlChkcZQTzKsp4Yaidb7MxKLIHobxOaclEJzRh3kQcMrkf9
	ZpknLITb3loBrONqi9RVatmTss+JrCfJFAAB98bqIx3EfqutEbi59srvTilJ8R/28+US
	gFEA==
X-Gm-Message-State: ALoCoQn4kAepnDnmwyA23sBn/TrJCinysk5/HvsKFCRlfVEtptSHKokCpemiHjaqLpRoYeCHU55Z
X-Received: by 10.224.79.139 with SMTP id p11mr11203514qak.93.1410527076924;
	Fri, 12 Sep 2014 06:04:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 12 Sep 2014 06:04:16 -0700 (PDT)
In-Reply-To: <1410512089-10975-1-git-send-email-marie.kowalczyk@vodalys.com>
References: <1410512089-10975-1-git-send-email-marie.kowalczyk@vodalys.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Sep 2014 14:04:16 +0100
Message-ID: <CAJTo0LaDmKWFBN0-9Uc1oCe0n-nUR_p5yr0hL7reeUOJ1XxcLw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: jean-michel.hautbois@vodalys.com
Subject: Re: [meta-multimedia][PATCH] gstreamer1.0-plugins-bad.inc : Add rtmp support in gstreamer.
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
X-List-Received-Date: Fri, 12 Sep 2014 13:04:36 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2014 09:54, Marie Kowalczyk <marie.kowalczyk@vodalys.com> wrote:
> RTMP feature depends on rtmpdump.
>
> Signed-off-by: Marie Kowalczyk <marie.kowalczyk@vodalys.com>

I've queued this for oe-core, but for future reference patches against
oe-core should go to the oe-core@ list, not oe-devel@.

Cheers,
Ross

