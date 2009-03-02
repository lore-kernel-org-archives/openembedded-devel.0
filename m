Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1LdzJo-0005cu-6D
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 04:59:52 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id C804F46751
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2009 16:56:00 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id B6A4346749for 
	<openembedded-devel@lists.openembedded.org>; Mon,  2 Mar 2009 16:56:00 
	+1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KFU00501X2UQY00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Mon,02 Mar 2009 16:56:00 +1300 (NZDT)
Received: from [172.25.116.23] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KFV005ZK1L8UB00@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Mon,02 Mar 2009 16:55:58 
	+1300 (NZDT)
Date: Mon, 02 Mar 2009 16:55:54 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
To: openembedded-devel@lists.openembedded.org
Message-id: <49AB58CA.7090406@tait.co.nz>
MIME-version: 1.0
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
X-imss-version: 2.053
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
Subject: fatal: Not a git repository
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
X-List-Received-Date: Mon, 02 Mar 2009 03:59:52 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Anyone else getting this?

    NOTE: Handling BitBake files: / (6587/6587) [100 %]
    NOTE: Parsing finished. 6302 cached, 0 parsed, 285 skipped, 0 masked.
    NOTE: Cache is clean, not saving.
    NOTE: build 200903021645: started
    fatal: Not a git repository <----------------------

    OE Build Configuration:
    BB_VERSION        = "1.8.12"
    ...

The same complaint seems to crop up at various points during a build, as 
well.

Suggestions?
Douglas.






=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



