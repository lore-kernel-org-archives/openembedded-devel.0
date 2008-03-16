Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JanyT-0008OA-Ax
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Mar 2008 09:12:11 +0100
Received: by py-out-1112.google.com with SMTP id y77so4705447pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2008 01:09:41 -0700 (PDT)
Received: by 10.65.224.11 with SMTP id b11mr27632447qbr.42.1205654981614;
	Sun, 16 Mar 2008 01:09:41 -0700 (PDT)
Received: from ?192.168.1.204? ( [24.107.189.117])
	by mx.google.com with ESMTPS id e16sm17526424qba.30.2008.03.16.01.09.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 16 Mar 2008 01:09:41 -0700 (PDT)
Message-ID: <47DCD5BE.5010902@gmail.com>
Date: Sun, 16 Mar 2008 03:09:34 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <19c1b8a90803132350x14a3496en8e921fae09cf9aff@mail.gmail.com>	<47DA38DF.6020307@adtelecom.es>	<19c1b8a90803151021g7d0eb612j1f37ce818c50ac47@mail.gmail.com>
	<200803160857.14602.openembedded@haerwu.biz>
In-Reply-To: <200803160857.14602.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 64.233.166.179
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-vfs-2.20.0 needs glib-2.0-2.14.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Mar 2008 08:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

On 03/16/2008 02:57 AM, Marcin Juszkiewicz wrote:
> Dnia Saturday 15 of March 2008, Khem Raj napisa³:
>> Joaquim,
>>
>> I tried with 2.16.1 and it does not help either I end up in the same
>> message compiling gnome-vfs 2.20.0. I think we should stick to 2.14.x
>> if we are using gnome-2.20
>>
>> With newer version of gnome it might be ok.
> 
> Poky has same problem after glib 2.16.1 upgrade. Upgrading gnome-vfs to 
> 2.22.0 resolved problem.
> 

hrw,

Would you take a look at oebug 4061 and apply?

http://bugs.openembedded.net/show_bug.cgi?id=4061

Regards
Gordon




