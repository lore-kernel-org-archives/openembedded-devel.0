Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.97])
	by mail.openembedded.org (Postfix) with ESMTP id 918156D7C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 17:31:29 +0000 (UTC)
Received: from [216.82.254.211:46396] by server-1.bemta-7.messagelabs.com id
	DA/02-24188-27411825; Mon, 11 Nov 2013 17:31:30 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-8.tower-201.messagelabs.com!1384191089!8060033!2
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27641 invoked from network); 11 Nov 2013 17:31:30 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-8.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	11 Nov 2013 17:31:30 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Mon, 11 Nov 2013 11:31:39 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.327.1; Mon, 11 Nov 2013 11:31:29 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Mon, 11 Nov 2013 18:30:57 +0100
Message-ID: <52811451.8070303@digi.com>
Date: Mon, 11 Nov 2013 18:30:57 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, =?ISO-8859-1?Q?Eric_?=
	=?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
References: <1383844369-15682-1-git-send-email-eric@eukrea.com>
	<3733774.a8GcKzRnyp@helios>
In-Reply-To: <3733774.a8GcKzRnyp@helios>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Mon, 11 Nov 2013 17:31:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,


On 11/11/13 14:13, Paul Eggleton wrote:
>
> Patch merged to meta-webserver master, thanks.
>
> Cheers,
> Paul

Thanks for pushing it to master.

As it's a trivial change (wrong SRC_URI) is it scheduled somehow for 
dora and dylan backporting or should I explicitly ask for the backport?

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

