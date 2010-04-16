Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2pBD-0003Rq-0E
	for Openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 19:18:11 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id A2E22EB71C
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:14:42 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 13:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=JqihDA7yQp47SynVuaCjQLFMoF8=;
	b=aA0NEQwknSvp6oO83PyzzDrKPtSm1JCluhnHhGfEX87bA6jHnGx2NpOUwqrekYkSbok1Jy3jtmVlNxrIBK2cDJdOWoAOFqp8CmWQSsL56a2zDWBzNN9OJNtrNuY3tKZP8chT41XVd0uElS5vjNsSRq9wIZVvx/UPaQK2NjIK5sU=
X-Sasl-enc: d5UAv907KKeKjzDLLPmEHpxQf2+zuH+Ri3dtyDVa93LI 1271438082
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 20A124B0492
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:14:42 -0400 (EDT)
Date: Fri, 16 Apr 2010 19:14:40 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: canutils
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
X-List-Received-Date: Fri, 16 Apr 2010 17:18:11 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

The current CAN stack in linux needs updated userspace code.  The
following two patches build canutils from pengutronix.

Bye,
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


