Received: from server.road.de ([85.10.209.111] helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <j.erdmann@road.de>) id 1O5K8C-00017y-E2
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 16:45:25 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 0368239000B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 16:41:50 +0200 (CEST)
Received: from [192.168.116.53] (bienemaja.handy-pc.constin.de
	[192.168.116.53])
	by slimfast.dyndns.org (Postfix) with ESMTP id A73E045416D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 16:41:49 +0200 (CEST)
Message-ID: <4BD1B1AD.9050505@road.de>
Date: Fri, 23 Apr 2010 16:41:49 +0200
From: Jens Erdmann <j.erdmann@road.de>
Organization: Road GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100411 Icedove/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 85.10.209.111
X-SA-Exim-Mail-From: j.erdmann@road.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: package installed_size field
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
X-List-Received-Date: Fri, 23 Apr 2010 14:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi folks,

I have a question in package creation. In my build process i create ipkg 
packages and i don't understand, how the installed_size has to be 
detected and where it will be set. My first idea were the 
package_ipkg.bbclass but it's missing there. How do you manage this?


-- 
------- ROAD ...the handyPC Company - - -  ) ) )

Jens Erdmann
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing director: Hans-Peter Constien



