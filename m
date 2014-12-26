Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7556C72715
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 17:22:17 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so13200877pde.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=IeZu8o8k1mzQunb2j/pxfe/rQxCtmTH6dBoDSEJT0po=;
	b=eLTDB8Q9bJYMC9VqFeolgyIIu2zce/ieDZlZFCV68vAcaY5D3goeMMx9WEBNKPCGVX
	G90eiQ709a9sSfHeRH+v7zUfnG1RK4/i9oJlS8kpazcwv9jI0YKgNidwZMJxGw65Hf8J
	diEe3L6oqkQsIs+VHN4oivQBG09Q+ECi7hiZGrcEd3jyEcLRPvdnWvWa+EuU+l+vT3K3
	LCJZmOWuN6Mifc3g50J9AefWHaIgdht0gzcu6PLXEy97eh+1/HkkZknsGTmNZ9Ce3lHK
	jn53VFkGPI5zO2qpJaLxbLdDpIrf+gqiKS9Uj9OBfFKsCZVxuz0EuZGmhWLT8Jo0enYY
	I3cw==
X-Received: by 10.70.22.208 with SMTP id g16mr68749318pdf.141.1419614537572;
	Fri, 26 Dec 2014 09:22:17 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:45d3:7811:c39e:509c?
	([2601:c:a700:272f:45d3:7811:c39e:509c])
	by mx.google.com with ESMTPSA id i5sm28924918pat.6.2014.12.26.09.22.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Dec 2014 09:22:16 -0800 (PST)
Message-ID: <549D9945.7020000@gmail.com>
Date: Fri, 26 Dec 2014 09:22:13 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"paul.eggleton@linux.intel.com >> Paul Eggleton"
	<paul.eggleton@linux.intel.com>
References: <cover.1419546494.git.paul.eggleton@linux.intel.com>
	<2a581eb64141e55750a0569e15d1203c597b7dea.1419546494.git.paul.eggleton@linux.intel.com>
In-Reply-To: <2a581eb64141e55750a0569e15d1203c597b7dea.1419546494.git.paul.eggleton@linux.intel.com>
Subject: Re: [meta-networking][PATCH 1/1] ntp: upgrade to 4.2.8
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
X-List-Received-Date: Fri, 26 Dec 2014 17:22:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

  Dizzy needs these too. Can we upgrade Dizzy too or do we want patches 
only?

- Armin
On 12/25/2014 02:29 PM, Paul Eggleton wrote:
> CVE-2014-9293, CVE-2014-9294, CVE-2014-9295, and CVE-2014-9296

