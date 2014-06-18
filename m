Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9561265F1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 16:41:07 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id et14so927329pad.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=T8QFIk+C0Rs8SxhFbSuc+EEXJ64+CoaMA/GnzN3nBbo=;
	b=ABZeP602P1uEthoP8wt1HGKCtFGETCI5MYCy6Nhls48v8rGXETkAGNkdVrPOVnhkwX
	2HutErvO3wmuYwdCWsze4w5+Yu2dTsvKN9qak8TZPwTt6OmalEOItWmTWVALSmEwC+fT
	W5aSH57dD0IyMmmnT029wuVmJ98aeXz5d9kmxECCeM2ltDWrs1fpXQIJZ/WYj2Osuhd2
	EmgTv/If9Xgw7mM3EFkHMHmSeInNPebpT0ctywAjtb+jSqa6T+VNvoeZ4n71OLujPWoG
	fcJ2j52Kwt1H3oxqQKziFL9GQqBgMAimCcr9RVPZO9rK/LYjUNdYnkyybT+JM5RhpnII
	iEZA==
X-Received: by 10.66.102.74 with SMTP id fm10mr3809436pab.79.1403109667763;
	Wed, 18 Jun 2014 09:41:07 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id iz2sm4268515pbb.95.2014.06.18.09.41.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Jun 2014 09:41:06 -0700 (PDT)
Message-ID: <53A1C120.2060008@gmail.com>
Date: Wed, 18 Jun 2014 09:41:04 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20140430143741.GL2486@jama>	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>	<20140505164514.GM2486@jama>
	<536A7C42.6030502@balister.org>	<20140511145337.GE22774@jama>
	<20140616134850.GP2428@jama>	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>	<CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>
	<CAP9ODKp4+TAv8F1o01ts8o-aWzKEGdXJdrhj3doHfm69xOBxJw@mail.gmail.com>
In-Reply-To: <CAP9ODKp4+TAv8F1o01ts8o-aWzKEGdXJdrhj3doHfm69xOBxJw@mail.gmail.com>
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 18 Jun 2014 16:41:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 06/18/2014 08:20 AM, Otavio Salvador wrote:
> On Wed, Jun 18, 2014 at 11:04 AM, Cliff Brake <cbrake@bec-systems.com> wrote:
>> On Wed, Jun 18, 2014 at 7:27 AM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>
>>>
>>> Are you willing to take meta-qt5 too?
>>
>> Sure.
>>
>> https://github.com/cbrake/meta-qt5/commits/daisy-to-merge
>>
>> I made some more updates to the meta-oe daisy branch:
>>
>> https://github.com/cbrake/meta-openembedded/commits/daisy-to-merge
>>
>> Otavio, Armin, would you like me to add your emails to the maintainer
>> lists in these readme's as well?
>
> Yes, please add me.
>

Yes. add me as well.

- Armin

