Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SPIck-0004Kf-8O
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 21:20:34 +0200
Received: by qady23 with SMTP id y23so2722099qad.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=B5VF6fsnHzMvFl6m5mQ+z3le8dEjwJw92kKJc1NxEuM=;
	b=GA1EIOknQbBUrgfWzK90t8twiAHYzdfiRmanZyEjPblV+kMa5nIIHkHh0/A6KvuNt/
	WjDtXRTwJSFU0Y7xYDMB3DcfMjWI62j+8dcB4qEsi3gQcGh7CxrQi37YR6tFXbnzHqQQ
	GoE5uEk5dwb+Z1oz0GqdzQoJocdFxtQwU6WTQ/fdhbuccBEr4jTnM6O32HfTEnDXCkCp
	K2vC8Z3epXqLNAJglewX1r2DyibymeoXgT7zbacJdpvzhP0KF6+ieHmwR4aKBYrTJJR7
	aUcKbBxBPYQBhFCaJMDurS1odG6sT1oh/Oc8OH4bPYurO/Lq8U1JEyLaxClq5Pz7pW9J
	EMTw==
MIME-Version: 1.0
Received: by 10.229.135.138 with SMTP id n10mr6796629qct.110.1335899450487;
	Tue, 01 May 2012 12:10:50 -0700 (PDT)
Received: by 10.229.217.200 with HTTP; Tue, 1 May 2012 12:10:50 -0700 (PDT)
Date: Tue, 1 May 2012 21:10:50 +0200
Message-ID: <CAC+thW1MhdQD9ofG1tyY7voJDPQXETvj2iFAgC9uNFDNUPJ6NA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: right directory for a recipe
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
X-List-Received-Date: Tue, 01 May 2012 19:20:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm planning to port a recipe from oe-classic to meta-openembedded and
submit patches to the list. The particular recipe is libmodbus, but my
question is more general.
I looked around for documentation suggesting how meta-oe/ dir is laid
out, but found nothing in particular. Any pointer here?
What would be the right directory to put libmodbus in? I understand
recipes-* names are somewhat self explanatory, but I'm still confused
if "recipes-extended", "recipes-support" or anything else is the best
choice.

TIA
Andrea


