Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 400C873C27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 19:49:19 +0000 (UTC)
Received: by iedm5 with SMTP id m5so25410673ied.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=G7rImUk5+EeitF8RseSVEbvMyPjvp3a0arI0AsPyKBk=;
	b=zQwOmre5N8vfjy1YpdfmI2jx0sxK+4Q8SVV16esaigUgk9/hq1hl6ZMHnKr2rLVmWn
	csvuD1DD9ogO4PLKc4Frd04ZxVZmUYO+2OavtYIbu2VFb6/P/zc8VwJS5L5XUdM9kNPL
	QDqana2g8DAflDoMVut0RgssGlzWEThMa8RBzPDHKpJT1RQO/2vEqpzJBir7RZ5VuJGO
	MaEBff1SvOxqpbIfko0uQh640cpE3yj1lvkH54GpzGEerhsdG6jU0SQ/8rk+E6AJEwTu
	ErgW5h9tijK9eyQO6fwnAvHy1n3q1wqt/OFJToITr4M64Wwi//GisC2qAogwnp/Qsbrb
	4D2Q==
X-Received: by 10.50.126.6 with SMTP id mu6mr7081323igb.4.1427831360870;
	Tue, 31 Mar 2015 12:49:20 -0700 (PDT)
Received: from [10.22.11.55] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id o8sm10700543igp.11.2015.03.31.12.49.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 12:49:19 -0700 (PDT)
Message-ID: <551AFA34.6010007@gmail.com>
Date: Tue, 31 Mar 2015 12:49:08 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1427426569.git.akuster808@gmail.com>
	<20150330203748.GA14683@saldanha.aker.com.br>
In-Reply-To: <20150330203748.GA14683@saldanha.aker.com.br>
Subject: Re: [PATCH 00/18] Dizzy pull request
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
X-List-Received-Date: Tue, 31 Mar 2015 19:49:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hugo,

I will look into that.

thanks.
armin

On 03/30/2015 01:37 PM, Hugo Vasconcelos Saldanha wrote:
> Hi,
>
> On Fri, Mar 27, 2015 at 12:26:59AM -0300, Armin Kuster wrote:
>> Please consider this changes for meta-openembedded dizzy-next
>
> It would be great if commit c5398fc0fe246e4828c9e950f779f437266bfaa1
> gets added do dizzy also.
>
> Thanks!
>
>

