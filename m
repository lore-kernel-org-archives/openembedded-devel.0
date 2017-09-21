Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 70B0F77E66;
	Thu, 21 Sep 2017 00:57:44 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id b11so2619372pgn.12;
	Wed, 20 Sep 2017 17:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=OUx0yLaLQZ6y/0IvoAIocFvbgBBJJUaPDRbftUm/Aq8=;
	b=t9W9LzTrglfwHvlLkOtilTGmAlPJORnfjbpuLcdIAnwkc1ixDMR22ztUuKXNVff9nJ
	K+g42cqgk2Ne5e9gANur+SxM1Ij1Q9Tww3qkmkYsAcfnvVZSrdGnlgtCnMwAivl4jfqK
	xeZWRlvQqAh1ZQ54DjN+Qj+2tvz+EyrGtXVtI7JR6pDnj5fOIa3iBUbQnlcu3grm2Lvq
	eb5d2jmAK3+XfsXWogvuNWtl1pmnfDdmv5LQsn8XdEoB3MyTd2jKTqorTj8EER4Armkg
	t+9LSl9GBbmz9IFojcDaYwbPj6xqJfIzTv8t2bNNgpeYrcLMn7fYYzmbhlJsC6dtDkav
	RLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OUx0yLaLQZ6y/0IvoAIocFvbgBBJJUaPDRbftUm/Aq8=;
	b=dbr2FZVzNfed3pnaCIAjQ7s/0SnJ7mkq/EYatmmVlmGPJ41s9xjm6ykx+9s0hwVbCg
	PHAcvdxFSq5aQzN5OYMFTrzrv2eysOcUY9F/FW1HJSHfi0LGNwlfUVKMldnevsjvAjz1
	li4oXdw73ddeijjrZFMllX4D86k6PLBmrqMuwgmkDuoogM9moqUl+LnSJvjb2uJgi4AG
	73VQRloEDW0rD/k4H2Hw4kPmsdov6mzDFHpu4SVxjPV0ODd45sPyzxrgMAk1A5fb/6Le
	KhBZvjW38x7CqKMqeEZR4wdoV5PuSW03ykMqV9qcXVuTUqN37RsvqJjxeUC6/DMTCryb
	0Kvg==
X-Gm-Message-State: AHPjjUiXyjbOfNv9+Kd4F35tG1e8zoY8QbJZhhpzjemEMTxR9GLyyMoZ
	1P0Hs2bNuHM6Ue9X+xy+B5UN9g==
X-Google-Smtp-Source: AOwi7QAIFrMbXHcsV1WAVls0+V6fJkbGNm1Jn5Qbn096H7Dn1QhMQxm5jjc6+Zb36Eh8kU9Zi3WQvQ==
X-Received: by 10.99.115.28 with SMTP id o28mr3991150pgc.374.1505955465207;
	Wed, 20 Sep 2017 17:57:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6413:eafd:1152:fa5c?
	([2601:202:4001:9ea0:6413:eafd:1152:fa5c])
	by smtp.gmail.com with ESMTPSA id 20sm197293pft.109.2017.09.20.17.57.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 17:57:44 -0700 (PDT)
To: Jeff Osier-Mixon <jefro@jefro.net>, Khem Raj <raj.khem@gmail.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
	<CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
	<CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8eedf692-5a12-f5a6-b9da-8184849a7a50@gmail.com>
Date: Wed, 20 Sep 2017 17:57:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
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
X-List-Received-Date: Thu, 21 Sep 2017 00:57:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Jefro,

We have 33 folks listed. Do we have room?

regards,

Armin


On 09/20/2017 11:24 AM, Jeff Osier-Mixon wrote:
> Zoom might be easier, as people can dial in or connect online. We'll make
> it work.
>
> On Tue, Sep 19, 2017 at 12:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Tue, Sep 19, 2017 at 9:54 AM, Trevor Woerner <twoerner@gmail.com>
>> wrote:
>>> On Tue, Sep 19, 2017 at 11:34 AM, Sean Hudson <sean_hudson@mentor.com>
>> wrote:
>>>>   Meeting information, including dial-in numbers, is on the wiki. [2]
>>> In addition to the above, we could also make use of the little-used
>>> #oe-meeting channel on freenode (?)
>> +1
>>
>> I can dial in. Or someone can setup a zoom meeting
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


