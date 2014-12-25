Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8179072644
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Dec 2014 01:55:01 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id eu11so10893149pac.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Dec 2014 17:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=6TmAAM1++c/KwqPchLraV6mSnkHatUxaHcsbUUTSK50=;
	b=eK/YNaERj5pD6AYcboAmio+ko329ICUfLJsc33vZjBdcJRtp2JrDD+Cc8vulVJyanZ
	Ylsj56mJlsXymeOM/5ewnRxfyTHPT6vfMDw6NYEuzHkqer7cd+C6NpSa2bCMbhzwEmks
	LvEicX037XFfIsxbERWcqt6+YfwSSZ7OEr+z3FwuFkn51Ah/sw59qw04h8UGMgNvgrPt
	ooarHcc4RxSfWo59CeYsuq0Ap7UMoYLEoqNlqow1zjAxKntUHnbNgEhiPdzrv10DbzVq
	b2WWPTn1nCLSMLS/FbzSPMJdyEu+ZsplVrNOBBLKpCXCbGmbnoDbXO3MVS7hkBqzepv+
	WzCw==
X-Gm-Message-State: ALoCoQkmGdD+MyqEKO1O1TqOsXRrOzZ2dZlXNwn2SRL9VFqPP3COTf6K3ez6ZawpUzSoCZLTIuAr
X-Received: by 10.70.128.232 with SMTP id nr8mr26408818pdb.110.1419472501748; 
	Wed, 24 Dec 2014 17:55:01 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:5d28:e12b:b1:5c36?
	([2601:c:a700:272f:5d28:e12b:b1:5c36])
	by mx.google.com with ESMTPSA id
	ob4sm23997922pdb.48.2014.12.24.17.55.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Dec 2014 17:55:01 -0800 (PST)
Message-ID: <549B6E72.3040504@mvista.com>
Date: Wed, 24 Dec 2014 17:54:58 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Joe MacDonald <joe@deserted.net>
References: <549B69BB.5000804@gmail.com>
In-Reply-To: <549B69BB.5000804@gmail.com>
Subject: Re: proftpd update
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
X-List-Received-Date: Thu, 25 Dec 2014 01:55:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ok, I'm a dork. I see the fix is already in.

- Armin

On 12/24/2014 05:34 PM, akuster808 wrote:
> Hello,
>
> Is anyone working on back porting CVE-2013-4359 to proftpd?  if not, I
> intend on upgrading the recipe to 1.3.5. I will send patches for Dizzy
> and Daisy. ETA, sometime before year's end.
>
> - Armin

