Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id E59E978956
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 19:29:55 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id h127-v6so27170008lfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=91C8UyhFtH2cCmKeFL16A3Nz4nwe1J8N8KlNxfkJiiw=;
	b=U6FyDS9nJY7yNTwTIpmM0rJCC8y4e5bsLdLRspv5Fcm9zIa4mKCDuNRtHyQe6il6DK
	dQ+M5/JIXFGoH9SfyOLPSR3vDYA2jX9OVbQHdzQQ35ooKBDf4cB3lyoS6qQyqT8VS2mf
	jQsM5jMYy1YNxLGWHpUBW23f4WtzF/Jyqo99UOphoBr6gqy75uZtHKrJIvOk0MOQbAwL
	hprs19mNFsWBVQ6284ZQqOVu9d/7xUbwORS09wkzsxNpmybmUcmyR119XaYp3dNVMGhi
	xJvwxmrCNbolzNdv9GJs7s2e6QeTIRL4++78eISS+hxtcU7QdV76G3JDbpnaL2ZkZUJl
	pZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=91C8UyhFtH2cCmKeFL16A3Nz4nwe1J8N8KlNxfkJiiw=;
	b=XCdztFCOKUJdtpuwiKM8aREo/PfUUZ8Vo+UptM4pV8r+agZyQp+2aB7vIYGdgBGJAb
	87H70ZTix1GKANwGf29+c3C02vPZgUr1fZJbEtWETBQ0IoPSu2DGuaKou4dZEOmQX5be
	ei7trHg3NxRITMVEF/NhT6GX2Sr0GMfYFR24boGE7IyBykL+rNK2vnccxXjWQo8ttNjz
	EUMR9RcgOmr+0myR9zhKUolaoaNC2gb/Lv4CJ5OECeJ8J1AJ58ccwhLjNfXb6N2HpPP9
	NkgTTFu03hbn0p8knw1ve2ZqPzBCsnclMZahGYcrNmDx6ERZuGaK8PMD9boTK4/D50va
	5rsg==
X-Gm-Message-State: AElRT7HTG8WEhlt84oMM2Y7ioVt0eEP6yBN2crLJ6BM5Lzb3rd7ptVaZ
	xTdGAuztQmzJJTQaV3Es61ElIQ==
X-Google-Smtp-Source: AG47ELssQCazBVUGUgAmys26mvb6mMHLjB3w/oz6gjiarsMRWq8KZFEdqvVekJ0STjgkLooVdb9Npw==
X-Received: by 2002:a19:1081:: with SMTP id 1-v6mr9354035lfq.86.1521487796116; 
	Mon, 19 Mar 2018 12:29:56 -0700 (PDT)
Received: from ?IPv6:2001:14ba:806b:f800:dd48:3b87:4535:9b3?
	(dtb1-tyh9ly94rvl1bh5t-3.rev.dnainternet.fi.
	[2001:14ba:806b:f800:dd48:3b87:4535:9b3])
	by smtp.googlemail.com with ESMTPSA id
	h75-v6sm172698lfe.62.2018.03.19.12.29.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 12:29:55 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<20180319155951.GW4418@bill-the-cat.ec.rr.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <cacb3c83-0b9d-c1c1-4685-58b48f277a04@gmail.com>
Date: Mon, 19 Mar 2018 21:29:53 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319155951.GW4418@bill-the-cat.ec.rr.com>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Mon, 19 Mar 2018 19:29:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 19/03/2018 17.59, Tom Rini wrote:

> I would suggest that for sumo, any layers that do get moved /
> re-distributed / whatever, a "dummy" version be kept in place that says
> where it moved to (or where recipes were migrated to, or whatever is
> appropriate) and then they can be dropped in master.
>
Commit message with details should be enough for this kind of 
information. Leaving files behind would be just confusing.

Thanks,
Vesa Jääskeläinen

