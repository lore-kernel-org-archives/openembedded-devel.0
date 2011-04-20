Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1QCY3W-0000PI-Q7
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 16:06:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8ED42BA76F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:04:36 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22933-01-4 for
	<openembedded-devel@lists.openembedded.org>; 
	Wed, 20 Apr 2011 10:04:36 -0400 (EDT)
Received: from [172.20.22.83] (dmzgw2.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 86207BA7653
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 10:03:51 -0400 (EDT)
Message-ID: <4DAEE7C6.2030101@cbnco.com>
Date: Wed, 20 Apr 2011 10:03:50 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1303283391.git.michael.lippautz@gmail.com>
	<iom5kt$2h5$1@dough.gmane.org>
In-Reply-To: <iom5kt$2h5$1@dough.gmane.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [meta-oe 0/6] add syslog-ng/eventlog/libnet
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
X-List-Received-Date: Wed, 20 Apr 2011 14:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Being able to trace the origin isn't worth having broken recipes at
> various points due to missing checksums IMO.

Yeah, in this case meta-oe is getting a newer version of a recipe than 
what's in old OE, so there's not much reason to keep the history.

On the other hand if a recipe is imported into meta-oe, and it has a few 
lines changed from the same version of the old OE recipe, it'd be nice 
to see the changes in a commit on either old OE or meta-oe so we don't 
lose the reason for the change.

Mike


