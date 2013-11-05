Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 5E3AF6D092
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2013 16:48:24 +0000 (UTC)
Received: (qmail 3249 invoked by uid 1003); 5 Nov 2013 16:48:26 -0000
Received: from unknown (HELO ?172.20.1.188?)
	(philip@balister.org@12.199.200.124)
	by mail.geekisp.com with (RC4-MD5 encrypted) SMTP;
	5 Nov 2013 16:48:25 -0000
User-Agent: K-9 Mail for Android
In-Reply-To: <3804059.5QtrfmzGgR@helios>
References: <3804059.5QtrfmzGgR@helios>
MIME-Version: 1.0
From: Philip Balister <philip@balister.org>
Date: Tue, 05 Nov 2013 08:48:13 -0800
To: openembedded-devel@lists.openembedded.org
Message-ID: <3e23d89f-486d-41d9-9bd4-604126918474@email.android.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Public TSC meeting today
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
X-List-Received-Date: Tue, 05 Nov 2013 16:48:25 -0000
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

I can't make it. I hope the not is running for you.

Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>Hi all,
>
>Just a reminder, there will be a public OpenEmbedded TSC meeting today.
>If 
>you're interested in discussing long-term technical efforts around the 
>OpenEmbedded project please join us on irc.freenode.net in channel #oe
>at 
>17:00 GMT (9am PDT, 11am CDT, 12 EDT, 18:00 CEST, 17:00 BST) today.
>
>Cheers,
>Paul
>
>-- 
>
>Paul Eggleton
>Intel Open Source Technology Centre
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
From philip@balister.org  Tue Nov  5 23:23:15 2013
Return-Path: <philip@balister.org>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 240AC6D67B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2013 23:23:15 +0000 (UTC)
Received: (qmail 28722 invoked by uid 1003); 5 Nov 2013 23:23:16 -0000
Received: from unknown (HELO ?10.16.32.54?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	5 Nov 2013 23:23:16 -0000
Message-ID: <52797DE3.8070203@balister.org>
Date: Tue, 05 Nov 2013 15:23:15 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: [oe] Create meta-sdr
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
X-List-Received-Date: Tue, 05 Nov 2013 23:23:17 -0000

Based on earlier discussion, we'd like to go ahead and create meta-ssdr
based on this branch:

https://github.com/balister/meta-oe/commits/meta-sdr

Can someone give me a hand getting this setup in git?

Thanks,

Philip

