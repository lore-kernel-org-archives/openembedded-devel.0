Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id DE49678943
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=o1m+I4/SiRi4KlqE70w6DgDW3IqFJ8/fTAXVY8epZNQ=; 
	b=myzsrr7ZkHjzh+HgntHrPaLMQIYJiRxfX+bBu14mWqgWwK3/bDlpaDn6bya9pz2DjS9XqpYxJ6DdmARnwfUbnTvh6G/3gDgKVoVecp47bqnBxaETwFMmqSK1RQE3VdTrw+Qr9RcgqezlIzERQrg4EkjbpxSBkdcsOAG4vjlJJZLfGbXYOiOby+Ztv+4RpLUjUnt75VBp9Zwv4uuM4I8lqCr5rtv0JHknuZt+jW812oqFh0mb2LEuRagTH5nmcEOGBp3VSOULjwM/uMdGawB5JXUaeix054Du6P4KYUTEzMTfjv1ULN9HaTvgtWbUIgUf8UvQBJOEKThsyX9iylPYMA==;
Received: from [192.168.10.146] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1exv89-0004Tg-OO; Mon, 19 Mar 2018 14:47:17 +0100
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20180313222055.47545-1-psaavedra@igalia.com>
	<CALbNGRSvpDc4TzpOgumGtF7t+C+PQx16hZyB=vaSW7dMkc-gGA@mail.gmail.com>
From: Pablo Saavedra <psaavedra@igalia.com>
Message-ID: <f5e40164-17cd-19b1-68be-3e3f0a6c4fe5@igalia.com>
Date: Mon, 19 Mar 2018 14:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSvpDc4TzpOgumGtF7t+C+PQx16hZyB=vaSW7dMkc-gGA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] networkmanager upgrade to 1.10.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 13:47:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 15/03/18 15:30, Andreas Müller wrote:
> 2. Does this patch has a chance to land before sumo split (if
> autobuilds are ok)? Do we follow Yocto feature freeze these days?

If we find an arrangement for the issues that you found in the others
replies of this patch submission I guess we have a chance.


