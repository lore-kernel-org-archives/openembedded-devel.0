Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 413 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 18:09:10 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.12])
	by mail.openembedded.org (Postfix) with ESMTP id A14CA60782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 18:09:10 +0000 (UTC)
Received: from [216.82.249.131:54706] by server-12.bemta-12.messagelabs.com id
	83/2B-29721-AAA31635; Wed, 30 Apr 2014 18:02:18 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-3.tower-28.messagelabs.com!1398880937!18938098!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16911 invoked from network); 30 Apr 2014 18:02:17 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-3.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	30 Apr 2014 18:02:17 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 30 Apr 2014 13:02:13 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 30 Apr 2014 13:02:16 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 30 Apr 2014 20:02:14 +0200
Message-ID: <53613AA5.7040903@digi.com>
Date: Wed, 30 Apr 2014 20:02:13 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <53612125.8030702@digi.com>
	<1474887.TWMWxXuYEb@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1474887.TWMWxXuYEb@peggleto-mobl5.ger.corp.intel.com>
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] cherokee webserver SRC_URI broken again
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
X-List-Received-Date: Wed, 30 Apr 2014 18:09:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 30/04/14 19:28, Paul Eggleton wrote:
> I can't remember from our last discussion, did anyone talk to upstream about
> the pain they are inflicting on some of their users with the lack of proper
> source archives?

I don't think anybody talked to upstream about the problem. The mailing 
list seems almost dead (looking at gmane[1] last email was on May/2013):

<http://news.gmane.org/gmane.comp.web.cherokee.general>

There seems to exist also other channels to contact (Google+, Facebook):

<http://cherokee-project.com/doc/other_community.html>

but I don't use neither of them (G+, FB) so I'm not sure how active the 
project is.

Anyway I am leaving the office now for a short (4 days) break until 
Monday so in case we finally need to patch the recipe I can do that next 
week.

-- 
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

