Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6F86D2DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 14:50:26 +0000 (UTC)
Received: from [216.82.254.211:62795] by server-13.bemta-7.messagelabs.com id
	23/51-04975-2B8AB725; Thu, 07 Nov 2013 14:50:26 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-6.tower-201.messagelabs.com!1383835826!7471295!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.9.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31381 invoked from network); 7 Nov 2013 14:50:26 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-6.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Nov 2013 14:50:26 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 08:50:29 -0600
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.158.1;
	Thu, 7 Nov 2013 08:50:25 -0600
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 7 Nov 2013 15:50:23 +0100
Message-ID: <527BA8AE.4000306@digi.com>
Date: Thu, 7 Nov 2013 15:50:22 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <5256CE06.60502@digi.com> <20131010213127.14c4f478@e6520eb>
In-Reply-To: <20131010213127.14c4f478@e6520eb>
Subject: Re: Dylan backports
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
X-List-Received-Date: Thu, 07 Nov 2013 14:50:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric, all,

On 10/10/13 21:31, Eric Bénard wrote:
> both pushed to dylan-next for testing.
>
> Thanks
> Eric

I appreciate you included the patches into 'dylan-next' for testing but 
it surprises me they are not in *dylan* yet.

Is this normal? I sent the patches a couple of months ago. They were 
included for testing almost one month ago and yet they are not in *dylan*.

For the moment i keep the patches as *bbappends* in our own layer, but i 
would like to get rid of them once they are included in 'meta-openembedded'.

Thanks for your help.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

