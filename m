Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NbKjQ-0005Qm-Tx
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 22:19:56 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NbKh4-0006La-OL from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 13:17:26 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 30 Jan 2010 13:17:26 -0800
Received: from 172.30.80.215 ([172.30.80.215]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sat, 30 Jan 2010 21:08:14 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	30 Jan 2010 14:08:15 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Nat3b-0004cf-RY@melo.openembedded.org>
References: <E1Nat3b-0004cf-RY@melo.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Sat, 30 Jan 2010 14:08:14 -0700
Message-Id: <1264885694.4951.9.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 30 Jan 2010 21:17:26.0274 (UTC)
	FILETIME=[9F260620:01CAA1F1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Philip Balister : task-sdk-native: Convert to use an inc file for the basic native sdk.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jan 2010 21:19:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-01-29 at 15:46 +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: cd149ebbd44ee4cc91f1c44d39a4105bc95f2cdc
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=cd149ebbd44ee4cc91f1c44d39a4105bc95f2cdc
> 
> Author: Philip Balister <philip@balister.org>
> Date:   Fri Jan 29 10:45:22 2010 -0500
> 
> task-sdk-native: Convert to use an inc file for the basic native sdk.

Curious, why?  The first thing that came to mind would be
task-native-sdk-qte or something, but that would be handled by RDEP on
task-sdk-native.

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


