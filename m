Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6A43471985
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 23:58:05 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id 14so28436972pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=d40J1dMjKhTW8uimZd+IhDBc4VQ81/LtynYQg8/FBn0=;
	b=tIpDdzJh7CrjFjg6pqiGcJpHWLyyXz+A91u9xJdPUmbwd9iZvxXSZ0mZ8pBhHYbPp3
	04LUoyqFfzqZqEk8cGOxLpjoy7Uj2jD1YmTF9gvkp0ISV1P1VZfXw5PSgh4n43uXUw4m
	vEavWh8e+EqYBVH8giP07zoGcNEn+nNVQPc15C2qE6wbNqFITW9NHKJDZoLKAXRHhiAV
	YOXVZdeHZDdSFwCNn57NRi7tmaeNjtK6boqh6QleyQdhkxtxmwiYjWeMVEMQhGRjzzXt
	7cgkEzWSb19bT6G1P+8KLXx9vi9hfaTewN88W/RRTRinr4Bn5mizc0m5S0YepCzuBZ2s
	3axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=d40J1dMjKhTW8uimZd+IhDBc4VQ81/LtynYQg8/FBn0=;
	b=FlqE4/uBSN1aAukofko8j5mn3c31Br9QyWvPMJ/IXNzMJCcdEdMsqF0lDvur5nVoW4
	Zoxb8XQwuxOcysQD7pRxHkVvplocD/b162xAShFwMPHa3jTjGgHNAkk0MbI3+PebM4fA
	RItdSwdNgJUNE5TQRigMbUxZ0N+Y/J79MfhxysynEjGpiTjUTLdY4kWtH3N4K1/VZKIP
	m9r12seO/kkR69WPreGvK1HfUpUOgGNS2GJKgiZmyFaZk94Tmes6dW1GA6YeTvb7Z2lj
	SuTtyGwXPBoCRhnCutcCCOrdTf1YxDd+86F4UMkh2ildZTXbOyeqjLZJyHu8ALK++PT6
	3mpw==
X-Gm-Message-State: AIkVDXImF8iD+o9osmjSkdSEmHIyui3R3hcXDCjVdRfgfR4+FpsJQvkECWcflI6YREj4Vw==
X-Received: by 10.98.14.84 with SMTP id w81mr362245pfi.168.1484697486274;
	Tue, 17 Jan 2017 15:58:06 -0800 (PST)
Received: from [10.43.100.166] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	191sm15741655pgd.40.2017.01.17.15.58.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jan 2017 15:58:05 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <6e19dc90-a9d9-7d13-69d9-f86788c16375@balister.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b7d559dc-ddc6-b35e-24f7-87f02adb19d8@gmail.com>
Date: Tue, 17 Jan 2017 15:58:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <6e19dc90-a9d9-7d13-69d9-f86788c16375@balister.org>
Subject: Re: pyyaml for python 2 and 3 for morty
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
X-List-Received-Date: Tue, 17 Jan 2017 23:58:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/17/2017 09:59 AM, Philip Balister wrote:
> What are the chances of getting this into morty also?
your request seems reasonable.  Once it hits master, I can bring it in.

- armin
>   meta-xilinx need
> the python3 version for something. They've added a local recipe to work
> around the issue, but this would be a better long term solution.
>
> https://patchwork.openembedded.org/patch/135639/
>
> Philip


