Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A7DA160132
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:14:14 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 77so123760297ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=DHnJfygAH8lqo9dXd56zT61eu28b58oryG7qeSo8x0w=;
	b=jrjpSJuXFtW8cnci/YU9FpEJjArmcBZQlBNcmSy+Bqv6C3Ey5nIhBYZObm/uwMRnqn
	aM/k7lHeyRhg4AZ8OG8Bc5iMok0TSvm9EQMMAQa6LEtyBO/pZfMtk6Se2/VK5WyNp/aD
	Rj96ZZOO75h6tT0TrJNnk5UQhvKZWi5zOzlw1hX+MMivndH3Rh/ii3/j2kFrnjbtmt09
	zxUhvie3EDWAc7ALcVbG61VLxP4f++kdu09DkpqaEZwn2eFOwxCzBFvdWhKGkmUZhD3i
	w5+oowT6kXFHBYwoto9LNCJ9TL9g0nTXz6WeDzuz1ECjBBk6oeCqXAHJzPFaRZ5mlzB/
	Rsig==
X-Received: by 10.107.132.162 with SMTP id o34mr74683108ioi.13.1451913255423; 
	Mon, 04 Jan 2016 05:14:15 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	129sm33274154ioo.23.2016.01.04.05.14.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 05:14:14 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1451677511-7346-1-git-send-email-twoerner@gmail.com>
	<1451677511-7346-4-git-send-email-twoerner@gmail.com>
	<5686D91E.3030400@gmail.com>
	<CAP9ODKp7UDLQUeZAca+ZbBc1H279yL5OXy2t_U7vjdnD8gMkow@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568A7024.20706@gmail.com>
Date: Mon, 4 Jan 2016 08:14:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp7UDLQUeZAca+ZbBc1H279yL5OXy2t_U7vjdnD8gMkow@mail.gmail.com>
Subject: Re: [meta-browser][RFC PATCH v1 3/4] chromium_40.0.2214.91: API keys update
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
X-List-Received-Date: Mon, 04 Jan 2016 13:14:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Otavio,

On 01/04/16 05:53, Otavio Salvador wrote:
> I applied the first two patches of this serie.

Awesome, thanks! I'm working on v2 now.

