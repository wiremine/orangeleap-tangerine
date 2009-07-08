/*
 * Copyright (c) 2009. Orange Leap Inc. Active Constituent
 * Relationship Management Platform.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package com.orangeleap.tangerine.domain.checkservice;

import org.springframework.core.NestedRuntimeException;

/**
 * Runtime Exception used to catch errors sent to the Paperless Payment Processor
 *
 * @version 1.0
 */
public class PaymentProcessorException extends NestedRuntimeException {

    public PaymentProcessorException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public PaymentProcessorException(String msg) {
        super(msg);
    }
}
