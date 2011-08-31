Received: from smtp.cardinalpeak.com ([208.43.163.138])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbeal@cardinalpeak.com>) id 1Qyp73-0002H8-NV
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 20:02:10 +0200
X-Footer: Y2FyZGluYWxwZWFrLmNvbQ==
Received: from [192.168.0.128] ([75.145.125.125])
	(authenticated user dbeal@cardinalpeak.com) by smtp.cardinalpeak.com
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 11:27:10 -0600
From: Dave Beal <dbeal@cardinalpeak.com>
To: openembedded-devel@lists.openembedded.org
Organization: Cardinal Peak, LLC
Date: Wed, 31 Aug 2011 11:25:18 -0600
Message-ID: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to prevent fetching?
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
X-List-Received-Date: Wed, 31 Aug 2011 18:02:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

My company is using OE to develop the embedded Linux infrastructure of a
medical device.  The US government agency that approves such devices
(FDA) requires that its source code be strictly controlled.  We would
like to configure our OE installation to prevent the fetching of new
source code except when we explicitly allow it.

Is there a way to accomplish this that doesn't require modifying all the
individual .bb files?  Is there a global configuration option that would
prevent fetching?  I've looked through the OE and Bitbake User Manuals,
but haven't found an answer.

Thank you!

Dave Beal
Cardinal Peak, LLC
Lafayette, Colorado, USA


Dave Beal 
Cardinal Peak
(303) 665-3962 x124 | Email | vCard
| Web | Company Blog | LinkedIn 

 

 



