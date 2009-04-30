Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LzViX-0002Yx-9L
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 14:50:21 +0200
Received: by gxk25 with SMTP id 25so2959150gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=XTouAqnkirWE6GNSNOI4/cfds7FglzDTFH9hY7IwiXo=;
	b=t2oxMAcWGQeD2oy6su1sxZMVlMSO4xCI7TdmycQ/bf5eW2fi8vvDQ17xiTIkG28L4r
	o5AgynFjGSyrCJxVDCo2zYuJ6cIrfNHdmUblFSbEW1Oz0SXmhAPUbRy5uOTKohCFGXxr
	bn/ayEWMPxhsNhtkuWUTL2ZmJ0D1KLgQsTZnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jn1xkwZpzbpxquqAxGJekLsT5LnZrkVZHt5igXsFz6RSgpRxALdBVbioEQ0n1pLqYk
	rY0ANs+CnKHDY20WRBPsECvOlbTEStbuzz6aiELyLnkS7uEQXP9Qh1/x8dfJmhaEqleh
	G3WP/R9NI7/ir7P87yug7ifllCadW6eu/Y5Gc=
MIME-Version: 1.0
Received: by 10.151.130.2 with SMTP id h2mr3470841ybn.224.1241095496478; Thu, 
	30 Apr 2009 05:44:56 -0700 (PDT)
Date: Thu, 30 Apr 2009 08:44:56 -0400
Message-ID: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: progress on OE organization issues
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
X-List-Received-Date: Thu, 30 Apr 2009 12:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

We are making progress on some of the OE organizational issues.

1) we have been offered a VM at OSUOSL for hosting OE infrastructure.
Same rack as kernel.org machines, and has a good reputation for
support and uptime.  See
http://wiki.openembedded.net/index.php/Infrastructure for more
details.
2) we are trying to push forward with some form of structure for
membership, and effective decision making:
http://wiki.openembedded.net/index.php/Organization.  Florian Boor has
offered to take care of the membership tasks.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


