Received: from [72.14.246.242] (helo=ag-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vneblx@gmail.com>) id 1KI3ma-0005iT-Ew
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jul 2008 17:46:40 +0200
Received: by ag-out-0708.google.com with SMTP id 9so6570787agd.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2008 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=eSXsk8a28kO2ZuHkcHbtN5MLhUGVTULdRuy0lFT+bF8=;
	b=uP8eQCLeoPSz1v4qNohDK2QmT0rHIDIhmTQVXmUm6qXXod/IK0oekvzSBJPvXXG+e7
	hfBzb3Tipc9tdEOJfjjs+fR2VcoBDdyPuLNgASnIulaQVe8nOsfrzHT0xFvbFArpbXk+
	mywC/uCjb02XZT59QSrPvj5JZkjeu6UTRE770=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=H+g0QnLkhIYzhhVP7uf/qOyLh/EypPsXXs9h4UP64wtWbkDs7s63Fnu07uHekob2/q
	jXt7bsBCwPrpYnndty5NnOsJHjnHTUHgrMeSrlWReYWXKjDFzv194chI5tWnLIAWyr9g
	9M3JlbUGZN+vDJBMzyZ6fzqKhjhOoeMM7d/ok=
Received: by 10.90.115.6 with SMTP id n6mr13571752agc.3.1215963972826;
	Sun, 13 Jul 2008 08:46:12 -0700 (PDT)
Received: by 10.90.88.13 with HTTP; Sun, 13 Jul 2008 08:46:12 -0700 (PDT)
Message-ID: <c38932520807130846p2129e511qc96ca99b3dee0878@mail.gmail.com>
Date: Sun, 13 Jul 2008 22:46:12 +0700
From: "Hien Pham" <vneblx@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.10
Subject: bitbake problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 13 Jul 2008 15:46:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

after installed Openembedded's tools, I tried bellow command:
[root@localhost stuff]# bitbake nano

I received following messages:

>NOTE: Handling BitBake files: | (0001/0001) [100 %]
>NOTE: Parsing finished. 1 cached, 0 parsed, 0 skipped, 0 masked.
>ERROR:  Openembedded's config sanity checker detected a potential
misconfiguration.
>    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
>    Following is the list of potential problems / advisories:

>    Do not use Bitbake as root.

how can I solve this problem?

Thanks and best regards,

